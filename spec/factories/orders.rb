FactoryBot.define do
  factory :order do
    email { Faker::Internet.email }
    status { Order.statuses[:processing] }
  end
end
