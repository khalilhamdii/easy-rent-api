# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    userName { Faker::Name.name }

    email { Faker::Internet.email }

    password_digest { BCrypt::Password.create(Faker::Internet.password) }

    role { 'USER' }
  end
end
