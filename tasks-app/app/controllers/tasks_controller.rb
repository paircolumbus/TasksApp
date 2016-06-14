class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    @tasks = Task.all
    redirect_to root_path
  end

  def update
    @task.update_attributes(task_params)
    redirect_to root_path
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
