exercise_entry_without_user model: StatsViewer.ExerciseEntry, repo: StatsViewer.Repo do
  test do
    date Ecto.DateTime.utc
    exercise "Bench Press"
    category "Chest"
    weight 20.0
    reps 10
  end
end
