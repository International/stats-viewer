defmodule FitNotes.CsvParserTest do
  use ExUnit.Case

  test "it should work" do
    result = FitNotes.CsvParser.parse(Path.join(__DIR__, "fit_notes_export.csv"))
    assert Enum.count(result) == 3
  end

  test "it should be possible to parse into objects" do
    entries = FitNotes.CsvParser.parse_into_entries(Path.join(__DIR__, "fit_notes_export.csv"))
    assert Enum.count(entries) == 2

    # 2015-09-17,Behind The Neck Barbell Press,Shoulders,30.0,10,,,
    # 2015-09-21,Stiff-Legged Deadlift,Legs,30.0,10,,,
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
