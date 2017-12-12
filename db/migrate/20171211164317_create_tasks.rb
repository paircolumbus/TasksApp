class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.datetime :completed_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
