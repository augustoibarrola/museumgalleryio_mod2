class Art < ApplicationRecord
  belongs_to :artist
  has_many :user_arts
end
