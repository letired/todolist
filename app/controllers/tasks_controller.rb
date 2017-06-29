class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.create
      redirect_to tasks_path
    else
      render 'tasks/index'
    end
  end

  private

  def task_params
  params.require(:task).permit(:name, :description, :complete)
  end
end
