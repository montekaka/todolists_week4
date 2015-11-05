class AddUserToTodoLists < ActiveRecord::Migration
  def change
    #add_column :todo_lists, :user, :reference
    add_reference :todo_lists, :user
  end
end
