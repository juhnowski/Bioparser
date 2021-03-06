defmodule Bioparser.CLI do
  @default_url "https://www.ebi.ac.uk/metagenomics/api/v1/"
  require Logger

  @moduledoc """
  Handle the comand line parsing and the dispatch to the
  various functions that end up generating a table of the
  MGnify API REST methods
  """
  def main(argv) do
    Logger.info("Fetching biodata")
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which return :help

  Otherwise it is a MGnify API URL

  Return a tuple of data `{"method":"url"}`, or `:help` if help was given.
  """
  def parse_args(argv) do
    # parse = OptionParser.parse(argv,  switches: [ help: :boolean],
    #                                   aliases: [ h: :help ])
    # case parse do
    #   { [ help: true ], _, _ } -> :help
    #   { _, [ url ], _ } -> { url }
    #   { _, [], _ } -> { @default_url }
    # _ -> :help
    # end

    OptionParser.parse(argv,  switches: [ help: :boolean],
    aliases: [ h: :help ])
    |> elem(1)
    |> args_to_internal_representation()
  end


  def args_to_internal_representation([]) do
    { @default_url }
  end

  def args_to_internal_representation(_) do # bad arg or --help
    :help
  end

  def process(:help) do
    IO.puts """
    usage: ./bioparser
    """
    System.halt(0)
    end

    def process({url}) do
      Bioparser.MGnify.fetch(url)
        |> decode_response()
    end

    def decode_response({:ok, body}), do: Poison.Parser.parse!(body, %{})
    def decode_response({:error, error}) do
      IO.puts "Error fetching: #{error["message"]}"
      System.halt(2)
    end
end
