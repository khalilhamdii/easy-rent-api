9.times do |_i|
  Car.create(
    model: 'Kia Rio',
    color: 'White',
    bodyStyle: 'Sedan',
    pricePerDay: '15',
    doors: '4',
    luggages: '3',
    seats: '5',
    engine: 'V',
    emissionsClass: 'Euro 6',
    transmission: 'Automatic',
    rentDeposit: '300',
    carImg: 'https://yearexcars.com/wp-content/uploads/autoroyal-uploads/2021/02/kia-rio-white-2017-min.jpg'
  )
end
