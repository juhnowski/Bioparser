# Bioparser

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bioparser` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bioparser, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/bioparser>.

# Test
To run our tests, we’ll use the 
```
mix test
``` 
task.

Fetch some url:
```
c
Bioparser.MGnify.fetch("https://www.ebi.ac.uk/metagenomics/api/v1/")
```

# Update dependencies
```
mix deps
mix deps.get
mix deps
```

# Build
```
mix escript.build
```
s
# Usage
```
./bioparser :help
```

# Run
```
./bioparser :help
```
will return:
