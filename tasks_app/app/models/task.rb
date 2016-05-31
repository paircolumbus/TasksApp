class Task < ActiveRecord::Base
  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: nil) }

  def mark_complete!
    if self.completed
      self.update_attribute(:completed, false)
    else
      self.update_attribute(:completed, true)
    end
  end

end
