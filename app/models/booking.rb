class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :home

  validates :start_date, :end_date, :no_of_guest, presence: true
  validates :end_date, date: { after_or_equal_to: :start_date }
  validates :no_of_guest, numericality: { greater_than_or_equal_to: 0 }
end
