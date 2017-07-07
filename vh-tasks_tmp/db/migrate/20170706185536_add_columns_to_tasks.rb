class AddColumnsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :description, :text
  end
end
