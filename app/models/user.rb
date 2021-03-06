class User < ApplicationRecord
    has_many :favorites, foreign_key: "user_id", class_name: "UserArt", dependent: :destroy
    #has_many :user_arts
    
    has_many :comments, dependent: :destroy
    has_many :user_arts, through: :comments, dependent: :destroy

    has_one_attached :profile_picture

    #commented below out to test user / user_art
    has_secure_password

    validates :email, uniqueness: true

end
