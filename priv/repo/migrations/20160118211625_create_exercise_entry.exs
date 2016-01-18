defmodule StatsViewer.Repo.Migrations.CreateExerciseEntry do
  use Ecto.Migration

  def change do
    create table(:exercise_entries) do
      add :date, :datetime
      add :exercise, :string
      add :category, :string
      add :weight, :float
      add :reps, :integer
      add :user_id, :integer

      timestamps
    end

  end
end
