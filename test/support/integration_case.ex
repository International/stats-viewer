defmodule StatsViewer.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import StatsViewer.Router.Helpers

      alias StatsViewer.Repo

      # The default endpoint for testing
      @endpoint StatsViewer.Endpoint

      hound_session
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(StatsViewer.Repo, [])
    end

    :ok
  end
end
