class AddCompleteBoolToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :complete, :boolean
  end
end
