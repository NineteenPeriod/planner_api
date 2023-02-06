defmodule PlannerApi.PlannerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlannerApi.Planner` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> PlannerApi.Planner.create_todo()

    todo
  end
end
