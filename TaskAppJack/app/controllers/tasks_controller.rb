class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
 
    if @task.complete
      @task.completed = "[X]"
    else
      @task.completed = "[ ]"
    end

    if @task.save
      redirect_to '/'
    else
      @tasks = Task.all
      render 'index'
    end
  end

  def update
    @task = Task.find(params[:id])
 
    if @task.complete #change marker to opposite of current state
      @task.completed = "[ ]"
    else
      @task.completed = "[X]"
    end

    @task.complete = !@task.complete #change state

    @task.save
    redirect_to '/'
  end

  def destroy
  @task = Task.find(params[:id])
  @task.destroy
 
  redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:description, :complete)
  end
end
