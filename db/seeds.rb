# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Size.create!(
#         name: "S"
# )
# Size.create!(
#     name: "M"
# )
# Size.create!(
#     name: "L"
# )
# Size.create!(
#     name: "XL"
# )
# 31.times do |n|
#   ProductSize.create!(
#       product_id: n+1,
#       size_id: 1,
#       quantity: n+100
#   )
# end
# 31.times do |n|
#   ProductSize.create!(
#       product_id: n+1,
#       size_id: 2,
#       quantity: n+100
#   )
# end
# 31.times do |n|
#   ProductSize.create!(
#       product_id: n+1,
#       size_id: 3,
#       quantity: n+100
#   )
# end
# 31.times do |n|
#   ProductSize.create!(
#       product_id: n+1,
#       size_id: 4,
#       quantity: n+100
#   )
# end

Ship.create!(
    name: "Regular Delivery(5 days)",
    price: 5
)
Ship.create!(
    name: "Express Delivery(3 days)",
    price: 10
)

Ship.create!(
    name: "One-Day Delivery",
    price: 15
)


Comment.create!(
  content: "I like it",
  user_id: 3,
  product_id: 31,
  reply_to: 1
)
Comment.create!(
  content: "Hi everyone!",
  user_id: 2,
  product_id: 31,
  reply_to: 1
)
Comment.create!(
  content: "Oh So Awesome",
  user_id: 3,
  product_id: 31,
  reply_to: 2
)
Comment.create!(
  content: "I want to order",
  user_id: 4,
  product_id: 31,
  reply_to: 2
)



Category.create!(
  name: "SPORTSWEAR",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "MENS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "WOMENS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "KIDS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "FASHION",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "CLOTHING",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "BAGS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "SHOES",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "CLOTHING",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
)
Category.create!(
  name: "NIKE",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 1
)
Category.create!(
  name: "UNDER ARMOUR",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 1
)

Category.create!(
  name: "ADIDAS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 1
)
Category.create!(
  name: "PUMA",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 1
)
Category.create!(
  name: "FENDI",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 2
)
Category.create!(
  name: "GUESS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 2
)
Category.create!(
  name: "VALENTINO",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 2
)
Category.create!(
  name: "VERSACE",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 2
)
Category.create!(
  name: "FENDI",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 2
)
Category.create!(
  name: "GUESS",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 3
)
Category.create!(
  name: "VALENTINO",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 3
)
Category.create!(
  name: "DIOR",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 3
)
Category.create!(
  name: "VERSACE",
  description: "cool clothes prevent you from feeling too hot",
  img_url: "home/product3.jpg",
  child_of: 3
)
Product.create!(
  name: "Shirt-01",
  cost: 50,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 10
)
Product.create!(
  name: "Dress-01",
  cost: 70,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 10
)
Product.create!(
  name: "Skirt-01",
  cost: 100,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 10
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 10
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 11
)
Product.create!(
  name: "Trouser-01",
  cost: 113,
  status: "sale",
  image: "shop/product12.jpg",
  category_id: 11
)
Product.create!(
  name: "Shirt-01",
  cost: 55,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 12
)
Product.create!(
  name: "Dress-01",
  cost: 72,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 12
)
Product.create!(
  name: "Skirt-01",
  cost: 101,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 12
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 12
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 12
)
Product.create!(
  name: "Shirt-01",
  cost: 56,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 14
)
Product.create!(
  name: "Dress-01",
  cost: 73,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 14
)
Product.create!(
  name: "Skirt-01",
  cost: 101,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 14
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 14
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 14
)
Product.create!(
  name: "Shirt-01",
  cost: 32,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 14
)
Product.create!(
  name: "Dress-01",
  cost: 44,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 15
)
Product.create!(
  name: "Skirt-01",
  cost: 100,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 15
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 14
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 14
)
Product.create!(
  name: "Shirt-01",
  cost: 32,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 14
)
Product.create!(
  name: "Dress-01",
  cost: 79,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 20
)
Product.create!(
  name: "Skirt-01",
  cost: 100,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 19
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 20
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 19
)
Product.create!(
  name: "Shirt-01",
  cost: 50,
  status: "new",
  image: "shop/product7.jpg",
  category_id: 19
)
Product.create!(
  name: "Dress-01",
  cost: 70,
  status: "new",
  image: "shop/product8.jpg",
  category_id: 19
)
Product.create!(
  name: "Skirt-01",
  cost: 100,
  status: "sale",
  image: "shop/product9.jpg",
  category_id: 20
)
Product.create!(
  name: "Shirt-01",
  cost: 110,
  status: "sale",
  image: "shop/product10.jpg",
  category_id: 20
)
Product.create!(
  name: "Coat-01",
  cost: 115,
  status: "sale",
  image: "shop/product11.jpg",
  category_id: 20
)
