defmodule PlannerApiWeb.FallbackController do
  use PlannerApiWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(PlannerApiWeb.ChangeSetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(PlannerApiWeb.ErrorView)
    |> render(:"404")
  end
end
