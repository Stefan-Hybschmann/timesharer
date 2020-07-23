class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).includes(:user).where(user: current_user)
    @booking = edit
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

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to home_bookings_path(@booking.home), notice: 'Your booking was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    home = @booking.home
    @booking.destroy
    redirect_to home_bookings_path(home), notice: 'Your booking was successfully deleted!'
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_guest, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
