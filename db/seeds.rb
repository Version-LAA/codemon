# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"
Booking.delete_all
puts "Booking cleaned"
Pokemon.delete_all
puts "pokemon cleaned"
User.delete_all
puts "pokemon cleaned"

puts "creating users"
User.create(email: "codemon@codemon.com", password: "password")
User.create(email: "tech@techtrek.com", password: "password")
User.create(email: "test@codemon.com", password: "password")
puts "users created"

poke_rarity = ['common', 'uncommon', 'rare']

puts "starting seed of pokemon"
51.times do |i|
  types = []
  if i!= 0
    url = "https://pokeapi.co/api/v2/pokemon/#{i}/"
    request = URI.open(url).read
    response = JSON.parse(request)
    pokemon_list = response
    puts "reading types"
    puts ""
    pokemon_list['types'].each do |type|
      types << type['type']['name']
    end
    poke = Pokemon.create(
      name: pokemon_list['name'],
      pokemon_type: types.sample,
      rarity: poke_rarity.sample,
      size: pokemon_list['height'],
      price: rand(20..1000.00).round(2),
      description: "A #{pokemon_list['height']} decimetres pokemon," \
                   "who is of the following type(s): #{types.join(',')} " \
                   "and #{pokemon_list['abilities'][0]['ability']['name']} ability ",
      user_id: User.all.sample.id
    )
    puts "#{poke.id} created successfully"
  end
end

puts "seed complete"
