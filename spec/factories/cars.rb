# spec/factories/cars.rb

FactoryBot.define do
  factory :car do
    model { 'Kia Rioa' }
    color { 'white' }
    bodyStyle { 'Sedan' }
    pricePerDay { '15' }
    doors { '4' }
    luggages { '3' }
    seats { '5' }
    engine { 'V' }
    emissionsClass { 'Euro 6' }
    transmission { 'Automatic' }
    rentDeposit { '1500' }
    after(:build) do |car|
      car.carImg.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'car.jpeg')),
                        filename: 'car.jpeg', content_type: 'image/jpeg')
    end
  end
end
