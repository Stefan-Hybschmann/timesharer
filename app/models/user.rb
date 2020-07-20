class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :notes
  has_many :ownerships
  has_many :homes, through: :ownerships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # check lecture for devise, to ensure we're doing it right !!!! (this needs editing)
  validates :name, :phone_number, presence: true
end
