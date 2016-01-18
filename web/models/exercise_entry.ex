defmodule StatsViewer.ExerciseEntry do
  use StatsViewer.Web, :model

  schema "exercise_entries" do
    field :date, Ecto.DateTime
    field :exercise, :string
    field :category, :string
    field :weight, :float
    field :reps, :integer
    belongs_to :user, StatsViewer.User

    timestamps
  end

  @required_fields ~w(date exercise category weight reps user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
