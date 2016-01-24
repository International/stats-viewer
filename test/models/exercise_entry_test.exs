defmodule StatsViewer.ExerciseEntryTest do
  use StatsViewer.ModelCase

  alias StatsViewer.ExerciseEntry

  defp valid_attributes do
    %{users: users} = fixtures(:users)

    %{
     category: "some content", date: "2010-04-17 14:00:00", exercise: "some content",
     reps: 42, user_id: users.test.id, weight: "120.5"
   }
  end

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ExerciseEntry.changeset(%ExerciseEntry{}, valid_attributes)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ExerciseEntry.changeset(%ExerciseEntry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
