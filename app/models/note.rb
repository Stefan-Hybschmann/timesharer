class Note < ApplicationRecord
  belongs_to :user
  belongs_to :home
  validates :content, presence: true, length: { minimum: 3, maximum: 500 }
end
