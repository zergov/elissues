# Elissues
CLI application made in Elixir that lets you lookup github repo issues using the Github API.

## Installation
Make sure you have elixir installed.

Build an executable:
```
$ mix escript.build
```

Run the executable:
```
$ elissues --help
>>
usage: elissues <username> <repo> [ count | 4 ]
```

```
$ elissues elixir-lang elixir 3
>>
| 2019-03-31T08:50:28Z | Add a better error message when overriding an umbrella dependency      | https://github.com/elixir-lang/elixir/pull/8924
| 2019-03-31T05:22:24Z | Cannot override an umbrella dependency                                 | https://github.com/elixir-lang/elixir/issues/8922
| 2019-03-20T11:35:57Z | Display the actual doctest code when doctset fails                     | https://github.com/elixir-lang/elixir/pull/8903
```
