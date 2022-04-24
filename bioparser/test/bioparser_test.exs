defmodule BioparserTest do
  use ExUnit.Case
  doctest Bioparser

  import Bioparser.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "count is defaulted if none url given" do
    assert parse_args([]) == { "https://www.ebi.ac.uk/metagenomics/api/v1/" }
    end
end
