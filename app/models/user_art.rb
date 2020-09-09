class UserArt < ApplicationRecord
    belongs_to :art
    belongs_to :user
    
    has_many :comments
    has_many :users, through: :comments
end
