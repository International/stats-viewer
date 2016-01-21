defmodule FitNotes.CsvToObjectMapper do
  alias StatsViewer.ExerciseEntry

  def adapt(csv_results) do
    for result <- csv_results do
      %ExerciseEntry{
        date: result.date, exercise: result.exercise,
        category: result.category, weight: result.weight,
        reps: result.reps
      }
    end
  end
end
