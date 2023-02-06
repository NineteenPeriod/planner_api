defmodule PlannerApiWeb.TodoController do
  use PlannerApiWeb, :controller
  alias PlannerApiWeb.FallbackController
  alias PlannerApi.Planner.Todo
  alias PlannerApi.Planner

  action_fallback FallbackController

  def index(conn, _params) do
    todos = Planner.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, params) do
    with {:ok, %Todo{} = todo} <- Planner.create_todo(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Planner.get_todo!(id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, params) do
    todo = Planner.get_todo!(conn.path_params["id"])

    with {:ok, %Todo{} = todo} <- Planner.update_todo(todo, params) do
      conn
      |> put_resp_header("location", Routes.todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)

      # render(conn, "show.json", todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Planner.get_todo!(id)

    with {:ok, _todo} <- Planner.delete_todo(todo) do
      conn
      |> send_resp(:no_content, "")
    end
  end
end
