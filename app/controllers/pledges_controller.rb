class PledgesController < ApplicationController
  before_action :set_pledge
  
  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.new
  end

  def create
    @pledge = @project.pledges.new(pledge_params)
    if @pledge.save
      redirect_to project_pledges_path(@project),
                  notice: "Thanks, your pledge has been received!"
    else
      render :new
    end

  end

private
  def pledge_params
    params.require(:pledge).permit(:name, :email, :pledge_amount)
  end

  def set_pledge
    @project = Project.find(params[:project_id])
  end
end
