class HomesController < ApplicationController
  def index
    @homes = Home.geocoded
    @homes = policy_scope(Home).joins(:ownerships, :users).where("ownerships.user_id = #{current_user.id}").distinct

    @markers = @homes.map do |home|
      {
        lat: home.latitude,
        lng: home.longitude
      }
    end
  end

  def show
    @home = Home.find(params[:id])
    @bookings_json = bookings_json
    @booking = Booking.new
    authorize @home
    @note = Note.new
    @notes = @home.notes.order(created_at: :desc)

    @homes = Home.geocoded
    @markers = [
      {
        lat: @home.latitude,
        lng: @home.longitude
      }
    ]
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

  def edit
    @home = Home.find(params[:id])
    authorize @home
  end

  def update
    @home = Home.find(params[:id])
    Home.update(home_params)
    authorize @home
    if @home.save
      create_ownership
      redirect_to home_path(@home), notice: 'Your home was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    authorize @home
    redirect_to homes_path, notice: 'Your home was successfully deleted!'
  end

  private

  def home_params
    params.require(:home).permit(:country, :city, :address, :maximum_no_of_guest, :no_of_bed, :home_name, :ranking, :photo)
  end

  def event_color(user)
    color = '#065143'
    case user.name
    when 'Stefan' then color = '#e9c46a'
    when 'Billy' then color = '#065143'
    when 'Juljan' then color = '#227c9d'
    when 'Jea' then color = '#f28482'
    end
    return color
  end

  def create_ownership
    @ownership = Ownership.new
    @ownership.user = current_user
    @ownership.is_admin = true
    @ownership.home = @home
    @ownership.shares_of_ownership = params["shares_of_ownership"]
    @ownership.save
  end

  def bookings_json
    hashes = @home.bookings.map do |booking|
      {
        title: booking.user.name,
        start: booking.start_date,
        end: booking.end_date,
        color: event_color(booking.user)
      }
    end
    hashes.to_json
  end
end
