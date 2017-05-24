class TasksController < ApplicationController

    def welcome
        @tasks = Task.all
    end

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

        @task.save
        redirect_to home_page
    end

    def update
        @task = Task.find(params[:id])

        @task.completed = true
        @task.save

        redirect_to home_page
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        redirect_to home_page
    end

    def complete
        @task = Task.find(params[:id])
        @task.completed = true
        redirect_to home_page
    end

    private

    def task_params
        params.require(:task).permit(:description, :completed)
    end

    def home_page
        '/'
    end

end
