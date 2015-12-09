class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    render 'index'
  end

  def update
    render 'index'
  end

  def destroy
    @task = params[:task]  
  end
end
