class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.boolean :completed
    end
  end
end
