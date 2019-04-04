defmodule Elissues.CLI do
  @moduledoc """
  Handle the command line inputs parsing and the dispatching
  to the various functions that end up displaying the list of
  github issues.
  """
  @default_count 4

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` can be -h or --help, which will return :help

  Otherwise, it's a github username, a repository and optionally the number
  of issues to fetch from github.

  Return a tuple of `{user, project, count}` or :help
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ user, project, count ], _ } -> { user, project, String.to_integer(count) }
      { _, [ user, project ], _ } -> { user, project, @default_count }
      _ -> :help
    end
  end
end
