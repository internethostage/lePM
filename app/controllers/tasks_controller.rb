class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :find_project, only: [:create, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.create task_params
    @task.project = @project
    if @task.save
      redirect_to project_path(@project), notice: "Task added successfully!"
    else
      render "/projects/show"
    end
  end

  def show
  end

  def index
    @tasks = Task.order(:title)
  end

  def edit
  end

  def update
    if @task.update task_params
    redirect_to project_path(@project), notice: "Task Updated"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project), notice: "Task Deleted"
  end

private

  def find_project
    @project = Project.find params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :status)
  end

  def find_task
    @task = Task.find params[:id]
  end


end
