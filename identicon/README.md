# Identicon

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

```
```
```
graph TD;
A[String] --> B{Compute MD5 hash of string};
B --> C{List of numbers based on the string};
C --> D{Pick color};
C --> E{Build grid of squares};
E --> F{Convert grid into image};
F --> G{Save image};
```
```
```



