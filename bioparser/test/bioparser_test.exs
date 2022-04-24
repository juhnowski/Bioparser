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

  test "parse data structure" do

    assert Poison.Parser.parse!("""
    {
      "data": {
          "biomes": "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"
      }
    }
    """, %{}) == %{"data" => %{"biomes" => "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"}}
  end

  test "parse datta" do
    l = Poison.Parser.parse!("""
    {
      "data": {
          "biomes": "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"
      }
    }
    """, %{})
    assert l["data"] == %{"biomes" => "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"}
  end

  test "parse domain url" do
    l = Poison.Parser.parse!("""
    {
      "data": {
          "biomes": "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"
      }
    }
    """, %{})
    assert l["data"]["biomes"] == "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"
  end

end
