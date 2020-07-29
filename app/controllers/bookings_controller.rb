class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).includes(:user).where(user: current_user)
    @booking = edit

    @homes = Home.geocoded
    # gives us all the homes which the current users have the bookings
    @homes = @homes.joins(:bookings, :users).where("bookings.user_id = #{current_user.id}")
    @markers = @homes.map do |home|
      {
        lat: home.latitude,
        lng: home.longitude
      }
    end
  end

  def home_bookings
    @home = Home.find(params[:id])
    authorize @home, :show?
    @bookings = @home.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @home = Home.find(params[:home_id])
    @booking.home_id = params[:home_id]
    authorize @booking
    @home = Home.find(params[:home_id])
    @booking.status = "Confirmed"
    # For Ranking, DO NOT DELETE!
    if @home.ranking == 'first come first served' || @home.bigger_owners(current_user).empty?
      @booking.save
      redirect_to home_bookings_path, booking_confirmed: 'Your home was successfully booked. TimeSharer wish you a happy stay, and hope to see you again soon. Remember you can see all of your bookings under "Bookings".'
    elsif @booking.valid?
      @booking.status = "Pending"
      bigger_owners = @home.bigger_owners(current_user)
      # iterate the bigger_owners and send them an email or message - to do
      bigger_owner = bigger_owners.each do |owner|
        p owner.name
        p owner.email
        p owner.phone_number
      end
      @booking.save
      redirect_to pending_home_booking_path(@home, @booking)
    else
      render :new
    end
  end

  def pending
    @booking = Booking.find(params[:id])
    authorize @booking
    @home = Home.find(params[:home_id])
  end

  def edit
  end

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
    params.require(:booking).permit(:no_of_guest, :start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
