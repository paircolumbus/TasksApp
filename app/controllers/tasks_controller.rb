class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.list = List.find(params[:list_id])

    if @task.save
      redirect_to list_path(@task.list.id)
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.toggle_completed!

    redirect_to list_path(@task.list.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @list = @task.list
    @task.destroy

    redirect_to list_path(@list)
  end

  private

    def task_params
      params.require(:task).permit(:description, :completed, :list_id)
    end
end
