class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]

	def index
		@tasks = Task.all
	end

	def show
	end

	def edit
	end

	def update
		if @task.update_attributes(task_params)
			redirect_to root_path
		end
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def destroy
		@task.destroy
		redirect_to root_path
	end


	private
	def set_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:description, :completed)
	end

end