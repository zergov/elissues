defmodule Elissues.GithubIssues do
  @user_agent   [ {"User-agent", "Elixir zergov@zergov.dev" } ]

  def issues_url(user, repo) do
    "https://api.github.com/repos/#{user}/#{repo}/issues"
  end
end
