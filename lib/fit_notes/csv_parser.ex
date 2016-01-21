defmodule FitNotes.CsvParser do
  def parse(input_file) do
    input_file |> File.stream! |> CSV.decode |> Enum.into([])
  end
end
