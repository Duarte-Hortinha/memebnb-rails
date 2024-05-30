class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :photo # adicionado devido ao cloudinary
  validates :title, :photo, :price, presence: true
  validates :title, length: { maximum: 50 }
  # validates :description, length: { maximum: 300 }
end
