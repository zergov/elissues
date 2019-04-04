defmodule GithubIssuesTest do
  use ExUnit.Case
  doctest Elissues

  import Elissues.GithubIssuesTest, only: [ issues_url: 1 ]

  test "issues_url returns a proper github's API url" do
    expected = "https://api.github.com/repos/zergov/elissues/issues"
    assert issues_url("zergov", "elissues") == expected
  end
end
