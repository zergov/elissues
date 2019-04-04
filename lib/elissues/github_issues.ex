defmodule Elissues.GithubIssues do
  @user_agent   [ {"User-agent", "Elixir zergov@zergov.dev" } ]

  def fetch(user, repo) do
    issues_url(user, repo)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, repo) do
    "https://api.github.com/repos/#{user}/#{repo}/issues"
  end

  def handle_response({ :ok, %{status_code: 200, body: body } }) do
    { :ok, body |> Poison.Parser.parse!() }
  end

  def handle_response({ _, %{status_code: _, body: body } }) do
    { :error, body |> Poison.Parser.parse!() }
  end
end
