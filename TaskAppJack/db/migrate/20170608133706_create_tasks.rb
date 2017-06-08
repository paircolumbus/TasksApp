class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete
      t.string :completed

      t.timestamps
    end
  end
end
