class Note < ApplicationRecord
  belongs_to :user
  belongs_to :home
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
end
