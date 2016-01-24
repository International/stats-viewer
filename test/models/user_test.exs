defmodule StatsViewer.UserTest do
  use StatsViewer.ModelCase

  alias StatsViewer.User

  alias EctoFixtures

  @valid_attrs %{password: "some content", email: "some content"}
  @invalid_attrs %{}

  defp build_user(opts \\ %{}) do
    EctoFixtures.fixtures(:users, opts)
  end

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "simple fixture test" do
    %{users: %{test: user}} = build_user
    assert user.email == Repo.get_by!(User, email: user.email).email
  end

  test "simple fixture test with override" do
    %{users: %{test: user}} = build_user(%{
      users: %{
        test: %{
          email: "potato@mail.com"
        }
      }
    })
    assert "potato@mail.com" == Repo.get_by!(User, email: user.email).email
  end

  test "adding exercises to an existing user should work" do

  end
end
