class ProjectsController < ApplicationController
  def index
    @projects = ["Go green label", "H&M eco line", "Banana dresses"]
  end
end
