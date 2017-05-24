require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save Task with description" do
      task = Task.new(:description => "Test description")
      assert task.save
  end

  test "should not save Task without description" do
      task = Task.new
      assert_not task.save
  end
end
