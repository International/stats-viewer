defmodule StatsViewer.HomePageTest do
  use StatsViewer.IntegrationCase

  test "visiting homepage" do
    navigate_to("/")
    IO.inspect(page_source())
  end

end
