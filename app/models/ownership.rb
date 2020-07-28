class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :home

  validates :shares_of_ownership, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def greater_shares_of_ownership?(user)
    user_ownership = Ownership.find_by(user: user, home: home)
    return false if user_ownership.nil?

    user_ownership.shares_of_ownership > shares_of_ownership
  end
end
