defmodule CliTest do
  use ExUnit.Case
  doctest Elissues

  import Elissues.CLI, only: [ parse_args: 1, sort_by_latest: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "something else"]) == :help
  end

  test "3 values returned if 3 given" do
    assert parse_args(["zergov", "elissues", "12"]) == {"zergov", "elissues", 12}
  end

  test "count param is defaulted to 4 if only two values is provided" do
    assert parse_args(["zergov", "elissues"]) == {"zergov", "elissues", 4}
  end

  test "sort_by_latest sort by 'created_at' field" do
    issues = [
      %{ "created_at" => "z", "other_key" => "something"},
      %{ "created_at" => "a", "other_key" => "something"},
      %{ "created_at" => "g", "other_key" => "something"},
    ]

    sorted = sort_by_latest(issues)
    assert (sorted |> Enum.map(&(&1["created_at"]))) == ["a", "g", "z"]
  end
end
