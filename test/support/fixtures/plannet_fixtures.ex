defmodule PlannerApi.PlannetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlannerApi.Plannet` context.
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
      |> PlannerApi.Plannet.create_todo()

    todo
  end
end
