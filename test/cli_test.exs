defmodule CliTest do
  use ExUnit.Case
  doctest Elissues

  import Elissues.CLI, only: [ parse_args: 1 ]

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
end
