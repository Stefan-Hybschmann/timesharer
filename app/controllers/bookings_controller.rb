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
    if @booking.save
      redirect_to homes_path, notice: 'Your home was successfully created!'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_guest, :start_date, :end_date)
  end
end
