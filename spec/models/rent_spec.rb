require 'rails_helper'

RSpec.describe Rent, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:userName) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:pickUpDate) }
  it { should validate_presence_of(:pickUpTime) }
  it { should validate_presence_of(:returnDate) }
  it { should validate_presence_of(:returnTime) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:pricePerDay) }
end
