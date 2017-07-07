class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :complete, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    respond_to  do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to tasks_path, notice: 'Task was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :complete)
    end
end
