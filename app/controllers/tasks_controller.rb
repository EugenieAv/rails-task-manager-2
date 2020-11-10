class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # raise
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(permit_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(permit_params)
    redirect_to task_path(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end

  private

  def permit_params
    params.require(:task).permit(:title, :detail, :completed)
  end

end
