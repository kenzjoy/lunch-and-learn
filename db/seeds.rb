# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

athena = User.create!(
  name: 'Athena Dao',
  email: 'athenadao@bestgirlever.com',
  api_key: 'jgn983hy48thw9begh98h4539h4'
  )

reba = User.create!(
  name: 'Reba Rose',
  email: 'rebarose@bestgirlever.com',
  api_key: 'atg721ef27poq5hwbl88k3572f1'
  )

reba_fave_1 = reba.favorites.create!(country: "Afghanistan", recipe_link: "https://food52.com/recipes/20423-south-indie-cilantro-chutney", recipe_title: "South 'Indie' Cilantro Chutney" )
reba_fave_2 = reba.favorites.create!(country: "Lesotho", recipe_link: "http://www.internationalcuisine.com/lesotho-spinach-tangerine-soup/", recipe_title: "Lesotho Spinach and Tangerine Soup (Butha-")
athena_fave_1 = athena.favorites.create!(country: "British Indian Ocean Territory", recipe_link: "http://www.food.com/recipe/serrage-poulet-british-indian-ocean-territory-479532", recipe_title: "Serrage Poulet (British Indian Ocean Territory)")
