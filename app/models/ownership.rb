class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :home

  validates :shares_of_ownership, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
