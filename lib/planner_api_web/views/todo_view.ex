defmodule PlannerApiWeb.TodoView do
  alias PlannerApiWeb.TodoView
  use PlannerApiWeb, :view

  def render("index.json", %{todos: todos}) do
    render_many(todos, TodoView, "todo.json")
  end

  def render("show.json", %{todo: todo}) do
    render_one(todo, TodoView, "todo.json")
  end

  def render("todo.json", %{todo: todo}) do
    %{
      id: todo.id,
      title: todo.title,
      completed: todo.completed
    }
  end
end
