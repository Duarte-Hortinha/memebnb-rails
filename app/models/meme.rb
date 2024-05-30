class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :photo # adicionado devido ao cloudinary
  validates :title, :photo, :price, presence: true
  validates :title, length: { maximum: 50 }
  # validates :description, length: { maximum: 300 }
  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
