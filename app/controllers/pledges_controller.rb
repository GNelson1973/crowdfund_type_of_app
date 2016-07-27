class PledgesController < ApplicationController
  def index
    @pledges = Pledge.all
  end
end
