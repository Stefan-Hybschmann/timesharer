class HomesController < ApplicationController
  def index
    @homes = policy_scope(Home)
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      redirect_to homes_path, notice: 'Your home was successfully created!'
    else
      render :new
    end
  end

  private

  def home_params
    params.require(:home).permit(:country, :city, :address, :maximum_no_of_guest, :no_of_bed)
  end
end
