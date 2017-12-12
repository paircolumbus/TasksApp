class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      render json: @task
    else      
      render json: { error: "Error creating task", messages: @task.errors.full_messages }, status: :server_error
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.valid?
      render json: @task
    else 
      render json: { error: "Error updating task", messages: @task.errors.full_messages }, status: :error
    end
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
  end

  private
  def task_params
    params.permit(:completed_at, :title)
  end
end
