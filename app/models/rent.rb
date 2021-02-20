class Rent < ApplicationRecord
  belongs_to :user
  validates :userName, presence: true, length: { minimum: 4 }
  validates :model, presence: true
  validates :pickUpDate, presence: true
  validates :pickUpTime, presence: true
  validates :returnDate, presence: true
  validates :returnTime, presence: true
  validates :location, presence: true
  validates :pricePerDay, presence: true

end
