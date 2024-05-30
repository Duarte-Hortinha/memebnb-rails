class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :photo # adicionado devido ao cloudinary
  validates :title, :photo, :price, presence: true
  validates :title, length: { minimum: 4, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 300 }
end
