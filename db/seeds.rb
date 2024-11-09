# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Book.create(name: 'Harry Potter', price: 24.99)
Book.create(name: 'The lord of the rings', price: 29.99)
Book.create(name: 'Dracula', price: 20.99)

books = Book.all

30.times do
  book = books.sample
  quantity = rand(2..15)

  book.sells.create(
    quantity: quantity,
    day: Sell::DAYS.sample,
    total: quantity * book.price
  )
end
