class Meme < ApplicationRecord
  belongs_to :user
  has_one_attached :photo # adicionado devido ao cloudinary 
end
