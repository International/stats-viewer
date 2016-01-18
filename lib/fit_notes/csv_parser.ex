defmodule FitNotes.CsvParser do
  def parse(input_file) do
    File.stream!(input_file) |> CSV.decode |> Enum.into([])
  end
end
