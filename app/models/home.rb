class Home < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :ownerships, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :users, through: :ownerships

  validates :country, :address, :maximum_no_of_guest, presence: true
  validates :maximum_no_of_guest, :no_of_bed, numericality: { greater_than_or_equal_to: 0 }
  accepts_nested_attributes_for :bookings
end
