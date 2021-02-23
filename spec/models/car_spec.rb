require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:bodyStyle) }
  it { should validate_presence_of(:pricePerDay) }
  it { should validate_presence_of(:doors) }
  it { should validate_presence_of(:luggages) }
  it { should validate_presence_of(:seats) }
  it { should validate_presence_of(:emissionsClass) }
  it { should validate_presence_of(:transmission) }
  it { should validate_presence_of(:engine) }
  it { should validate_presence_of(:rentDeposit) }
  it { is_expected.to validate_attached_of(:carImg) }
end
