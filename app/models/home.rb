class Home < ApplicationRecord
  has_many :bookings
  has_many :ownerships
  has_many :notes
  has_many :users, through: :ownerships

  validates :country, :address, :maximum_no_of_guest, presence: true
  validates :maximum_no_of_guest, :no_of_bed, numericality: { greater_than_or_equal_to: 0 }
end
