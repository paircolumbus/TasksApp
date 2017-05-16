require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @subject = Task.new title: 'Shop', description: 'Buy milk and eggs'
  end

  it 'should be valid' do
    expect(@subject.valid?).to be true
  end
  
  it 'should have a title' do
    expect(@subject.title).not_to be nil
  end

  it 'is not complete by default' do
    expect(@subject.complete).to be false
  end
end
