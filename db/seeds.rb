# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image =  Rack::Test::UploadedFile.new(File.join(Rails.root,'/spec/images/flower.jpg'), 'image/jpg')

Product.create!([
   {
     name: 'Osmanthus fragrans aurantiacus',
     description: 'A cousin of the white-flowering Tea Olive, the Orange Tea Olive produces the same sweetly fragrant flowers but in a wonderful creamy orange color. Due to the presence of carotenes in the flowers, some say that the Orange Tea Olive has a more pleasant fragrance than the white.',
     color_name: 'red',
     zodiac_sign: Product::ZODIAC_SIGNS.first,
     price: 4.5,
     image: image
   },
   {
     name: 'Major Wheeler Red Trumpet Honeysuckle',
     description: 'Hands down the BEST red flowering honeysuckle vine we have ever grown in our nursery and in our own gardens, Major Wheeler Trumpet Honeysuckle is a "MAJOR" improvement of the species.',
     color_name: 'blue',
     zodiac_sign: Product::ZODIAC_SIGNS.second,
     price: 31,
     image: image
   },
   {
     name: 'Edgeworthia chrysantha - Paper Bush',
     description: 'One of the all-time favorite plants in our own gardens, Edgeworthia, also called Paper Bush, is a truly a multi-season color and fragrance factory. ',
     color_name: 'green',
     zodiac_sign: Product::ZODIAC_SIGNS.third,
     price: 10.99,
     image: image
   },
   {
     name: 'Little Gem Dwarf Southern Magnolia',
     description: 'For those who have limited space but want the beauty and fragrance of Southern Magnolia, unlike its larger cousins, which grow to 50 feet plus in height',
     color_name: 'orange',
     zodiac_sign: Product::ZODIAC_SIGNS.last,
     price: 5.7,
     image: image
   }
 ])
