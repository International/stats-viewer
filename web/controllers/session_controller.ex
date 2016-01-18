defmodule StatsViewer.SessionController do
  use StatsViewer.Web, :controller

  def new(conn, params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case StatsViewer.Session.login(session_params, User.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> render("new.html")
    end
  end
end