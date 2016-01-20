class TasksController < ApplicationController
  def new
  	@task = Task.new
  end

   def index
    @tasks = Task.all
   end

  def show
    @task = Task.find(params[:id])
  end

  def create
  	@task = Task.new(task_params)
  	if @task.save
 		  redirect_to tasks_path
 	  else
 		  render 'new'
 	  end
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  	def task_params
   	  params.require(:task).permit(:title, :completed)
  	end

end
