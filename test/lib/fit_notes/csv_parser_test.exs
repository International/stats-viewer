defmodule FitNotes.CsvParserTest do
  use ExUnit.Case

  require IEx

  test "it should work" do
    result = FitNotes.CsvParser.parse(Path.join(__DIR__, "fit_notes_export.csv"))
    assert Enum.count(result) == 21
  end
end
