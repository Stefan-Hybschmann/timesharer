class Home < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :ownerships, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :users, through: :ownerships

  has_one_attached :photo

  validates :country, :address, :maximum_no_of_guest, :ranking, presence: true

  validates :maximum_no_of_guest, :no_of_bed, numericality: { greater_than_or_equal_to: 0 }

  # For ranking by shares of ownerships (2)
  def ownership_for(user)
    ownership = ownerships.find do |o|
      o.user == user
    end
    return ownership
  end

  # For ranking by shares of ownerships
  def bigger_owners(current_user)
    current_user_ownership = ownership_for(current_user)

    bigger_ownerships = ownerships.select do |ownership|
      ownership.shares_of_ownership > current_user_ownership.shares_of_ownership
    end

    bigger_ownerships.map(&:user)
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  accepts_nested_attributes_for :bookings
end
