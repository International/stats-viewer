defmodule FitNotes.CsvParserTest do
  use ExUnit.Case

  test "it should work" do
    result = FitNotes.CsvParser.parse(Path.join(__DIR__, "fit_notes_export.csv"))
    assert result
  end
end
