class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.create task_params
    if @task.save
      redirect_to task_path(@task), notice: "Task added successfully!"
    else
      render :new
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
    redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    reditect_to task_path
  end

private

  def task_params
    params.require(:task).permit(:title, :due_date)
  end

  def find_task
    @task = Task.find params[:id]
  end


end
