class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {minimum: 15, maximum:100}
  validates :body,presence: true, length: {minimum: 15, maximum:660}

  has_one_attached :avatar
end
