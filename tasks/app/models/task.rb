class Task < ActiveRecord::Base
  def description_with_box
    completed ?  "[x] #{description}" : "[  ] #{description}"
  end

end
