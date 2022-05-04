# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create(name: "Fat tire bicycle", description: "A bicycle with big tires for cruising around town", image_url: "https://cdn.shopify.com/s/files/1/0074/5432/6862/products/R1972AZ_20B_ArgusST-GRY_PD1_1080x.png?v=1600262966", price: 489.99)

Product.create(name: "Backpacking tent", description: "A small, lightweight tent best used for backpacking", image_url: "https://www.rei.com/media/c76e9b8f-c763-4623-9b8b-69873ccc5229?size=784x588", price: 359.95)

Product.create(name: "Sleeping bag", description: "Warm and packable sleeping bag", image_url: "https://cdn.shopify.com/s/files/1/1416/5622/products/1_71378391-fa39-4d3e-a7ba-7c0cf8e8a064_1080x.jpg?v=1622719073", price: 299.99)
