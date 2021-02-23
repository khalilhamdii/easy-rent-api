require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) do
    User.new(userName: 'User',
             email: 'user@user.com',
             password_digest: BCrypt::Password.create('admin'),
             role: 'USER')
  end
  let(:invalid_user) do
    User.new(userName: 'ad',
             email: 'email@email.com',
             password_digest: BCrypt::Password.create('admin'),
             role: 'USER')
  end
  it { should have_many(:rents).dependent(:destroy) }
  it { should validate_presence_of(:userName) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { expect(valid_user).to be_valid }
  it { expect(invalid_user).not_to be_valid }
end
