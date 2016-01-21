defmodule FitNotes.CsvToObjectMapperTest do
  use ExUnit.Case
  alias FitNotes.CsvToObjectMapper

  test "it should work to map to db objects" do
    entries = FitNotes.CsvParser.parse(Path.join(__DIR__, "fit_notes_export.csv")) |>
      CsvToObjectMapper.adapt
    assert Enum.count(entries) == 2

    first = Enum.at(entries, 0)
    assert {2015, 9, 17} == {first.date.year, first.date.month, first.date.day}
    assert "Behind The Neck Barbell Press" == first.exercise
    assert "Shoulders" == first.category
    assert 30.0 == first.weight
    assert 10 == first.reps

    second = Enum.at(entries, 1)

    assert {2015, 9, 21} == {second.date.year, second.date.month, second.date.day}
    assert "Stiff-Legged Deadlift" == second.exercise
    assert "Legs" == second.category
    assert 30.0 == second.weight
    assert 10 == second.reps
  end
end
