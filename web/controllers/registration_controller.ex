defmodule StatsViewer.RegistrationController do
  use StatsViewer.Web, :controller
  alias StatsViewer.User

  require IEx

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case StatsViewer.Registration.create(changeset, StatsViewer.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> put_session(:current_user, changeset.id)
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end

end
