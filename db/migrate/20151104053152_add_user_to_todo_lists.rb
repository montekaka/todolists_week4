class AddUserToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :user, :reference
  end
end
