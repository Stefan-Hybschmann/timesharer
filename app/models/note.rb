class Note < ApplicationRecord
  belongs_to :user
  belongs_to :home
end
