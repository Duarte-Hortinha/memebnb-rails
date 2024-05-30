Meme.destroy_all
User.destroy_all

puts 'Create Users'
user = User.create!(
  email: 'sofia@example.com',
  password: 'password123'
)

puts 'Create memes'

memes = [
  {
    name: 'meme_1',
    price: 100,
    title: 'HTML and SCSS',
    user_id: user.id,
    img: "app/assets/images/bird-meme.jpg"
  },
  {
    name: 'meme_2',
    price: 200,
    title: 'Find the bug',
    user_id: user.id,
    img: 'app/assets/images/code.png'

  },
  {
    name: 'meme_3',
    price: 300,
    title: 'AI everywhere',
    user_id: user.id,
    img: 'app/assets/images/trompete.jpeg'
  },
  {
    name: 'meme_4',
    price: 400,
    title: 'Escaping',
    user_id: user.id,
    img: 'app/assets/images/window.jpeg'
  }
]

memes.each do |meme|
  meme[:name] = Meme.new(price: meme[:price], title: meme[:title], user_id: user.id)
  meme[:name].photo.attach(
    io: File.open(Rails.root.join(meme[:img])),
    filename: "#{meme[:name]}.jpg"
  )
  meme[:name].save!
end

puts 'Done seeding 🌱'
