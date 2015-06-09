class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :edit, :destroy]

  def index
    @project = Project.all.order("created_at desc")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Your Project Was Successfully Saved!"
    else
      render 'new', notice: "Ooops! Your Project Wasn't Created."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Your Project Was Updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end
end
