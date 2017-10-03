defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "100"]) == {"user", "project", 100}
  end

  test "count is default if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
