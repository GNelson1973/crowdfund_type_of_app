class ProjectsController < ApplicationController
  def index
    @projects = Project.actual
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Event succesfully updated!"
    else
      render :edit
    end
  end

  def new
    @project = Project.new(params[:project])
  end

  def create
    @project = Project.new(project_params)
    if @project.save # this calls the valid? method if any errors messages than not save
      redirect_to @project
    else
      render :new # not redirect_to than you loose the data filled out already
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :target_pledge_amount, :website, :pledging_ends_on, :team_members, :image_file_name)
  end

end
