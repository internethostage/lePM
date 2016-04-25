class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_project, only: [:show, :edit, :update, :destroy]


  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @user = current_user
    @project.user = @user
    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully"
    else
      render :new
    end
  end

  def show
    @task = Task.new
  end

  def index
    @projects = Project.all
  end

  def edit
    redirect_to root_path, alert: "Access Denied" unless can? :edit, @project
  end

  def update
    redirect_to root_path, alert: "Access Denied" unless can? :update, @project
    if @project.update project_params
      redirect_to project_path(@project), notice: "Project updated"
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, alert: "Access Denied" unless can? :destroy, @project
    @project.destroy
    redirect_to projects_path, notice: "Project deleted"
  end


private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_project
    @project = Project.find params[:id]
  end





end
