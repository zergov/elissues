defmodule Elissues.CLI do
  @moduledoc """
  Handle the command line inputs parsing and the dispatching
  to the various functions that end up displaying the list of
  github issues.
  """
  @default_count 4

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which will return :help

  Otherwise, it's a github username, a repository and optionally the number
  of issues to fetch from github.

  Return a tuple of `{user, repo, count}` or :help
  """
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [ help: :boolean],
                             aliases:  [ h:    :help   ])
    |> elem(1)
    |> args_to_internal_representation()
  end

  defp args_to_internal_representation([user, repo, count]) do
    { user, repo, String.to_integer(count) }
  end

  defp args_to_internal_representation([user, repo]) do
    { user, repo, @default_count }
  end

  defp args_to_internal_representation(_) do
    :help
  end

  def process(:help) do
    IO.puts """
    usage: elissues <username> <repo> [ count | #{@default_count} ]
    """
    System.halt(0)
  end

  def process({user, repo, count}) do
    Elissues.GithubIssues.fetch(user, repo)
    |> decode_response()
    |> sort_by_latest()
    |> Enum.take(count)
    |> Enum.map(&(Elissues.GithubIssues.simplified(&1)))
    |> Enum.map(&(IO.puts(&1)))
  end

  def sort_by_latest(issues) do
    issues
    |> Enum.sort(&(&1["created_at"] < &2["created_at"]))
  end

  defp decode_response({:ok, body}), do: body
  defp decode_response({:error, error}) do
    IO.puts "Error fetching issues from Github: #{error["message"]}"
    System.halt(2)
  end
end
