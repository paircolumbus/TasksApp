class TasksController < ApplicationController
  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.json { render :json => @tasks }
    end
  end

  def create
    @task = Task.new task_params
    respond_to do |format|
      format.json do
        if @task.save
          render :json => @task
        else
          render :json => { :errors => @task.errors.messages }, :status => 422
        end
      end
    end
  end

  def update
    @task = Task.find params[:id]
    respond_to do |format|
      format.json do
        if @task.update task_params
          render :json => @task
        else
          render :json => { :errors => @task.error.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
