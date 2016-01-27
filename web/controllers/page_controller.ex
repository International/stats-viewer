defmodule StatsViewer.PageController do
  use StatsViewer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", v: StatsViewer.SessionView, a: "new.html"
  end
end
