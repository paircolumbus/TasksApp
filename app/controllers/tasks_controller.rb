class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_url
  end

  def update
    @task = Task.find(params[:id])
    @task.complete = true
    @task.save
    redirect_to root_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url 
  end

  private
    def task_params
      params.require(:task).permit(:name, :complete)  
    end
end
