class Car < ApplicationRecord
  validates :model, presence: true
  validates :color, presence: true
  validates :bodyStyle, presence: true
  validates :pricePerDay, presence: true
  validates :doors, presence: true
  validates :luggages, presence: true
  validates :seats, presence: true
  validates :emissionClass, presence: true
  validates :transmission, presence: true
  validates :engine, presence: true
  validates :rentDeposit, presence: true
end
