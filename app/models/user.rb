class User < ApplicationRecord
  has_secure_password
  has_many :pictures
  validates :name, presence: true , length: {in: 3..15}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 5}
end
