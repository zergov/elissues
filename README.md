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
| 2017-06-22T09:41:01Z | Improve ExUnit output for assertions on process mailbox        | https://github.com/elixir-lang/elixir/issues/6248
| 2017-09-28T08:56:29Z | Support Erlang 21 new features                                 | https://github.com/elixir-lang/elixir/issues/6611
| 2017-10-09T16:07:43Z | with clause cannot match when case is inside else block        | https://github.com/elixir-lang/elixir/issues/6738
```
