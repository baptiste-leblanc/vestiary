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
Context.destroy_all
Look.destroy_all
Piece.destroy_all

puts "Everything is destroyed"
# Créer un contexte

user = User.new(name: "Ugo", email: "test@test.com", password: "password", gender: "male")
user.save
puts "User created"

context = Context.new(style: "Je recherche un vêtement pour un mariage", budget: "1000€ max")
context.save
puts "Context created"

look = Look.new(description: "Costume classique", name: "")
piece = Piece.new()
