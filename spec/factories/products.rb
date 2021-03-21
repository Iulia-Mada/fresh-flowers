FactoryBot.define do
  factory :product do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.paragraph }
    color_name { Faker::Color.color_name }
    zodiac_sign { Product::ZODIAC_SIGNS.first }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root,'/spec/images/flower.jpg'), 'image/jpg') }
  end
end
