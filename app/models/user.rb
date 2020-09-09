class User < ApplicationRecord
    has_many :favorites, foreign_key: "user_id", class_name: "UserArt"
    #has_many :user_arts
    
    has_many :comments
    has_many :user_arts, through: :comments

    #commented below out to test user / user_art
    #has_secure_password
end