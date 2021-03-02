class Car < ApplicationRecord
  validates :model, presence: true
  validates :color, presence: true
  validates :bodyStyle, presence: true
  validates :pricePerDay, presence: true
  validates :doors, presence: true
  validates :luggages, presence: true
  validates :seats, presence: true
  validates :emissionsClass, presence: true
  validates :transmission, presence: true
  validates :engine, presence: true
  validates :rentDeposit, presence: true
  has_one_attached :carImg, dependent: :destroy
  validates :carImg, attached: true, file_size: { less_than_or_equal_to: 2.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }
end
