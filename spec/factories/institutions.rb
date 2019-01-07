FactoryBot.define do
  factory :institution do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
    status { 1 }
    deleted { false }
  end
end
