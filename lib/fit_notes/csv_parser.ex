defmodule FitNotes.CsvParser do
  use Timex

  defmodule ParsedEntry do
    # Date,Exercise,Category,Weight (kgs),Reps,Distance,Distance Unit,Time
    defstruct date: nil, exercise: nil, category: nil, weight: 0,
      reps: 0, distance: 0, distance_unit: nil, time: nil
  end

  def parse(input_file) do
    input_file |> File.stream! |> CSV.decode |> Enum.into([])
  end

  def parse_into_entries(input_file) do
    parse(input_file) |> Enum.drop(1) |> Enum.map(fn el ->
      {:ok, date} = DateFormat.parse(Enum.at(el, 0), "{YYYY}-{0M}-{0D}")
      {weight, _} = Float.parse(Enum.at(el, 3))
      {reps, _}   = Integer.parse(Enum.at(el, 4))

      %ParsedEntry{
        date: date, exercise: Enum.at(el, 1), category: Enum.at(el, 2),
        weight: weight, reps: reps
      }
    end)
  end
end
