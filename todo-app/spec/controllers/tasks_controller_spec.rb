require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  it 'has an index route' do
    expect(get: '/').to route_to(
      controller: 'tasks',
      action: 'index'
    )
  end

  it 'has a new route' do
    expect(get: 'tasks/new').to route_to(
      controller: 'tasks',
      action: 'new'
    )
  end

  it 'has a show route' do
    expect(get: 'tasks/1').to route_to(
      controller: 'tasks',
      action: 'show',
      id: '1'
    )
  end

  it 'has an edit route' do
    expect(get: 'tasks/1/edit').to route_to(
      controller: 'tasks',
      action: 'edit',
      id: '1'
    )
  end

  it 'has a create route' do
    expect(post: 'tasks').to route_to(
      controller: 'tasks',
      action: 'create'
    )
  end

  it 'has a destroy route' do
    expect(delete: 'tasks/1').to route_to(
      controller: 'tasks',
      action: 'destroy',
      id: '1'
    )
  end
end
