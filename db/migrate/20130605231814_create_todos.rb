class CreateTodos < ActiveRecord::Migration
  def up
   create_table :todos do |t|
     t.string :todo_text
     t.date :due_date
     
   end 
  end

  def down
    drop_table :todos
  end
end
