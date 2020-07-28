class OwnershipsController < ApplicationController
  def index
    @home = Home.find(params[:home_id])
    @ownerships = policy_scope(Ownership)
    @ownerships = @home.ownerships
  end
end
