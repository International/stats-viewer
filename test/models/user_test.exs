defmodule StatsViewer.UserTest do
  use StatsViewer.ModelCase

  alias StatsViewer.User

  import EctoFixtures, only: [fixtures: 1]

  @valid_attrs %{password: "some content", email: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "adding exercise entries should work" do
    %{users: users} = fixtures(:users)
    IO.puts "users: #{users}"
    assert users
  end
end
