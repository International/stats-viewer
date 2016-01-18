defmodule StatsViewer.ExerciseEntryTest do
  use StatsViewer.ModelCase

  alias StatsViewer.ExerciseEntry

  @valid_attrs %{category: "some content", date: "2010-04-17 14:00:00", exercise: "some content", reps: 42, user_id: 42, weight: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ExerciseEntry.changeset(%ExerciseEntry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ExerciseEntry.changeset(%ExerciseEntry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
