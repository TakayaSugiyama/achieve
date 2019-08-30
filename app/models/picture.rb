class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image , presence: true 
  validates :description, length: {maximum: 50},
                          presence: true
end
