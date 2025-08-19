# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprimer toutes les entrées de la seed
User.destroy_all
Context.destroy_all
Look.destroy_all
Piece.destroy_all
LookPiece.destroy_all

puts "Everything is destroyed"

# Créer un user
user = User.new(username: "Ugo", email: "test@test.com", password: "password", gender: "male")
user.save
puts "User created"

# Créer un contexte
context = Context.new(objective: "Je recherche un vêtement pour un mariage", budget: "1000€ max", user_id: User.first.id)
context.save
puts "Context created"

# Créer un look
look = Look.new(description: "Costume classique desc", name: "Costume classique", context_id: Context.first.id)
look.save
look2 = Look.new(description: "Un truc bien pour l'anniv de mon amie beauf", name: "Tenue décontractée", context_id: Context.first.id)
look2.save
puts "looks created"

# Créer une piece
piece = Piece.new(clothing_category: "scarf", name: "Red scarf", description: "Red scarf", price: "10€", brand: "Ralph Lauren", shop_url: "www.google.com")
piece.save
puts "piece created"

# Créer un lookpiece
look_piece = LookPiece.new(look_id: Look.first.id, piece_id: Piece.first.id)
look_piece.save
puts "look piece created"
