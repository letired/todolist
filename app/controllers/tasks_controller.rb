class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else
      @tasks = Task.all
      respond_to do |format|
        format.html { render :index }
        format.js
      end
    end
  end

  private

  def task_params
  params.require(:task).permit(:name, :description, :complete)
  end
end
