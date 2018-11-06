class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def set_task
    @task = Task.find(params[:id])
  end

  def index
    #fetch all tasks
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    # display form for new, and add into dataabase
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    redirect_to tasks_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    #task = params[:task] # fetching the update details from the form
    # @task = Task.find(params[:id])
    @task.update(task_params)

    # redirect_to '/tasks' + task.id
    redirect_to task_path(@task)
  end

  def destroy
    # task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
