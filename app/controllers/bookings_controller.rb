class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).includes(:user).where(user: current_user)
  end
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.home_id = params[:home_id]
    authorize @booking
    @home = Home.find(params[:home_id])
    if @home.bigger_tenants.empty?
      if @booking.save
        redirect_to homes_path, notice: 'Your home was successfully created!'
      else
        render :new
      end
    elsif @booking.valid?
      bigger_tenants = @home.bigger_tenants(current_user)
      # iterate the bigger_tenants and send them an email or message
      redirect_to confirmation_path
    else
      render :new
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_guest, :start_date, :end_date)
  end
end
