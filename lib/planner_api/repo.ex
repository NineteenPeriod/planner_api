defmodule PlannerApi.Repo do
  use Ecto.Repo,
    otp_app: :planner_api,
    adapter: Ecto.Adapters.Postgres
end
