# spec/factories/rents.rb

FactoryBot.define do
  factory :rent do
    userName { Faker::Name.name }
    model {'Kia Rio'}
    pickUpDate {'2021-02-18'}
    returnDate {'2021-02-21'}
    pickUpTime {'08:00'}
    returnTime {'17:04'}
    location {'Agency 2'}
    pricePerDay {'15'}
    status {'Pending'}
  end
end