defmodule PlannerApiWeb.PageController do
  use PlannerApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
