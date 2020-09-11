class UserArt < ApplicationRecord
    belongs_to :user
    
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments, dependent: :destroy
end
