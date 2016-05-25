class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new 
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "'#{@task.title}' task has been created."
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "'#{@task.title}' task has been updated."
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    flash[:danger] = "'#{task.title}' task has been deleted."
    redirect_to '/'
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :complete)
    end
end
