defmodule FitNotes.CsvToObjectMapperTest do
  use ExUnit.Case
  alias FitNotes.CsvToObjectMapper

  require IEx

  test "it should work to parse csv results" do
    adapted = FitNotes.CsvParser.parse(Path.join(__DIR__, "fit_notes_export.csv")) |>
      CsvToObjectMapper.adapt
    assert Enum.count(adapted) == 2
  end
end
