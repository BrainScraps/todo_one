class AddDoneToTodos < ActiveRecord::Migration
  def up
  	add_column(:todos, "done_time", :datetime)
  end

  def down
  	remove_column :done_time
  end
end
