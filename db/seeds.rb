# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user
puts 'Create Users'
User.destroy_all
user = User.create!(
  email: 'user@example.com',
  password: 'password123'
)
# Create memes associated with the user
memes = [
  {
    price: 100,
    description: 'Funny meme 1',
    user_id: user.id
  },
  {
    price: 200,
    description: 'Funny meme 2',
    user_id: user.id
  },
  {
    price: 300,
    description: 'Funny meme 3',
    user_id: user.id
  },
  {
    price: 400,
    description: 'Funny meme 4',
    user_id: user.id
  }
]

puts 'Create memes'
Meme.destroy_all
memes.each do |meme|
  Meme.create!(price: meme[:price], description: meme[:description], user_id: user.id)
end

puts 'Done seeding 🌱'
