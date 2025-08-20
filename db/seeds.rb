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
LookPiece.destroy_all
Look.destroy_all
Message.destroy_all
Context.destroy_all
Piece.destroy_all
User.destroy_all

puts "Everything is destroyed"

# Créer un contexte

user = User.new(username: "ugo", email: "test@test.com", password: "password", gender: "male", height: 160, weight: 50)
user.save
puts "User created"

context = Context.new(objective: "Je recherche un vêtement pour un mariage", budget: "1000€ max", user_id: User.first.id)
context.save
puts "Context created"

look = Look.new(description: "A classic suit with a tailored jacket and matching trousers, made of wool, paired with a light-colored shirt, completed with a tie and elegant leather shoes.", name: "Classic costume", context_id: Context.first.id)
look.save
puts "look created"
look2 = Look.new(description: "A tailored navy wool blazer with matching slightly tapered trousers, paired with a classic white cotton shirt. Complete the look with a deep burgundy or navy silk tie, dark brown leather Derby shoes, and matching leather belt.", name: "Italian Summer Costume", context_id: Context.first.id)
look2.save
puts "look created"
look3 = Look.new(description: "A well-fitted dark suit, paired with a blue shirt. Complete the look with a simple silk tie, elegant leather shoes, a matching belt.", name: "Old Fashion Costume", context_id: Context.first.id)
look3.save
puts "look created"

piece = Piece.new(clothing_category: "jacket", name: "Black jacket", description: "Black costume jacket", price: "100€", brand: "Ralph Lauren", shop_url: "www.google.com")
piece.save
puts "piece created"
piece = Piece.new(clothing_category: "pull", name: "Red pull", description: "Red pull desc", price: "10€", brand: "Ralph Lauren", shop_url: "www.google.com")
piece.save
puts "piece created"

look_piece = LookPiece.new(look_id: Look.first.id, piece_id: Piece.first.id)
look_piece.save
puts "look piece created"

look_piece = LookPiece.new(look_id: Look.first.id, piece_id: Piece.last.id)
look_piece.save
puts "look piece created"
