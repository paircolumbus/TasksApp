class Task < ApplicationRecord
  belongs_to :list

  validates_presence_of :description

  def toggle_completed!
    update(completed: !completed)
  end
end
