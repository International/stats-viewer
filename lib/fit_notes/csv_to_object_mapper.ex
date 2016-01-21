defmodule FitNotes.CsvToObjectMapper do
  alias StatsViewer.ExerciseEntry

  def adapt(csv_results) do
    for result <- Enum.drop(csv_results,1) do
      %ExerciseEntry{
        
      }
    end
  end
end
