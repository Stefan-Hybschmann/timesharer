class Home < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :ownerships, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :users, through: :ownerships

  validates :country, :address, :maximum_no_of_guest, presence: true
  validates :maximum_no_of_guest, :no_of_bed, numericality: { greater_than_or_equal_to: 0 }

  def bigger_tenants(current_user)
    current_user_ownership = ownerships.find do |ownership|
      ownership.user == current_user
    end

    bigger_ownerships = ownerships.select do |ownership|
      ownership.shares_of_ownership > current_user_ownership.shares_of_ownership
    end

    bigger_ownerships.map(&:user)
  end
end
