defmodule StatsViewer.User do
  use StatsViewer.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    has_many :exercise_entries, StatsViewer.ExerciseEntry

    timestamps
  end

  defimpl String.Chars, for: StatsViewer.User do
    def to_string(model) do
      "email: #{model.email}, id: #{model.id}"
    end
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
  end

  def add_exercise_entries(model, exercise_entries) do

  end
end
