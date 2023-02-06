defmodule PlannerApi.PlannerTest do
  use PlannerApi.DataCase

  alias PlannerApi.Planner

  describe "todos" do
    alias PlannerApi.Planner.Todo

    import PlannerApi.PlannerFixtures

    @invalid_attrs %{completed: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Planner.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Planner.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{completed: true, title: "some title"}

      assert {:ok, %Todo{} = todo} = Planner.create_todo(valid_attrs)
      assert todo.completed == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Planner.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{completed: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Planner.update_todo(todo, update_attrs)
      assert todo.completed == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Planner.update_todo(todo, @invalid_attrs)
      assert todo == Planner.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Planner.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Planner.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Planner.change_todo(todo)
    end
  end
end
