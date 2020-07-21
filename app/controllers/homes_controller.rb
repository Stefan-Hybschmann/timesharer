class HomesController < ApplicationController
  def index
    @homes = policy_scope(Home)
  end


  def show
    @home =  Home.find(params[:id])
    authorize @home
  end

  def new
    @home = Home.new
    authorize @home
  end

  def create
    @home = Home.new(home_params)
    authorize @home
    if @home.save
      create_ownership
      redirect_to homes_path, notice: 'Your home was successfully created!'
    else
      render :new
    end
  end

  private

  def home_params
    params.require(:home).permit(:country, :city, :address, :maximum_no_of_guest, :no_of_bed, :home_name)
  end

  def create_ownership
    @ownership = Ownership.new
    @ownership.user = current_user
    @ownership.is_admin = true
    @ownership.home = @home
    @ownership.shares_of_ownership = params["shares_of_ownership"]
    @ownership.save
  end
end
