defmodule StatsViewer.HomePageTest do
  use StatsViewer.IntegrationCase

  test "visiting homepage" do
    navigate_to("/")
    assert page_title() == "Hello StatsViewer!"
  end

end
