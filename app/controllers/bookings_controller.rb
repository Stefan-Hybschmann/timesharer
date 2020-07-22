class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).includes(:user).where(user: current_user)
  end
end
