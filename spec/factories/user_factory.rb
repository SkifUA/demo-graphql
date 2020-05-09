FactoryBot.define do
  factory :user_default, class: User do
    name  { Faker::Name.name }
    email  { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end