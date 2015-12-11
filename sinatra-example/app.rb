require 'sinatra/activerecord'
require_relative 'models/task'
require 'haml'

class TaskApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, adapter: 'sqlite3', database: ':memory'
  set :method_override, true

  get '/' do
    haml :root
  end

  get '/tasks' do
    @tasks = Task.all
    haml :index
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    redirect to("/tasks")
  end

  post '/tasks' do
    @task = Task.create!(params)
    redirect to("/tasks")
  end

  put '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.update_attributes(
      completed: params[:completed]
    )
    redirect to("/tasks")
  end

  delete '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.destroy
    redirect to("/tasks")
  end
end
