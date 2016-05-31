class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  respond_to :html
  respond_to :js

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    #byebug
    @task = Task.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  def complete
    @task = Task.find(params[:id])
    @task.mark_complete!
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
