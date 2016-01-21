defmodule FitNotes.CsvToObjectMapper do
  alias StatsViewer.ExerciseEntry
  use Timex

  def adapt(csv_results) do
    for result <- Enum.drop(csv_results, 1) do
      {:ok, date} = DateFormat.parse(Enum.at(result, 0), "{YYYY}-{0M}-{0D}")
      {weight, _} = Float.parse(Enum.at(result, 3))
      {reps, _}   = Integer.parse(Enum.at(result, 4))

      %ExerciseEntry{
        date: date, exercise: Enum.at(result, 1),
        category: Enum.at(result,2), weight: weight,
        reps: reps
      }
    end
  end

end
