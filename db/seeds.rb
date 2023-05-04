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
User.create(email: "codemon@codemon.com", password: "password",name:"Latoya")
User.create(email: "latoya@codemon.com", password: "password",name:"Latoya")
User.create(email: "peter@codemon.com", password: "password",name:"Peter")
User.create(email: "andrew@codemon.com", password: "password",name:"Andrew")
User.create(email: "kameron@codemon.com", password: "password",name:"Latoya")
User.create(email: "bertrand@codemon.com", password: "password",name:"Bertrand")
puts "users created"

poke_rarity = ['common', 'uncommon', 'rare']

puts "starting seed of pokemon"
75.times do |i|
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
      description: "A #{pokemon_list['height']} decimetres pokemon, " \
                   "who is of the following type(s):#{types.join(',')} " \
                   "and has #{pokemon_list['abilities'][0]['ability']['name']} "\
                   "ability. This pokemon has a weight of #{pokemon_list['weight']} hecktograms!",
      user_id: User.all.sample.id,
    )
    photo_file = URI.open(pokemon_list['sprites']['front_default'])
    poke.photo.attach(io: photo_file, filename: "#{poke.name}.png", content_type: "image/png")
    puts "#{poke.id} created successfully"
  end
end

puts "seed complete"
