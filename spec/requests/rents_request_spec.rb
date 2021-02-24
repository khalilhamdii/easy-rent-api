require 'rails_helper'

RSpec.describe 'Rents', type: :request do
  # Initialize the test data
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:rents) { create_list(:rent, 20, user_id: user.id) }
  let(:id) { rents.first.id }

  # Test suite for GET /users/:user_id/rents
  describe 'GET /users/:user_id/rents' do
    before { get "/users/#{user_id}/rents" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user rents' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User with 'id'=0/)
      end
    end
  end

  # Test suite for POST /users/:user_id/rents
  describe 'POST /users/:user_id/rents' do
    let(:valid_attributes) do
      { rent: { userName: 'John Smith',
                model: 'Kia Rio',
                pickUpDate: '2021-02-18',
                returnDate: '2021-02-21',
                pickUpTime: '08:00',
                returnTime: '17:04',
                location: 'Agency 2',
                pricePerDay: '15',
                status: 'Pending' } }
    end

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/rents", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before do
        post "/users/#{user_id}/rents", params: { rent: { model: 'Kia Rio',
                                                          pickUpDate: '2021-02-18',
                                                          returnDate: '2021-02-21',
                                                          pickUpTime: '08:00',
                                                          returnTime: '17:04',
                                                          location: 'Agency 2',
                                                          pricePerDay: '15',
                                                          status: 'Pending' } }
      end

      it 'returns status code 422' do
        # expect(json['status']).to eq(422)
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(json['message']).to eq("Validation failed: Username can't be blank, Username is too short (minimum is 4 characters)")
      end
    end
  end

  # Test suite for PUT /users/:user_id/rents/:id
  describe 'PUT /rents/:id' do
    let(:valid_attributes) { { rent: { status: 'Rented' } } }

    before { put "/rents/#{id}", params: valid_attributes }

    context 'when rent exists' do
      it 'returns status code Updated' do
        expect(json['status']).to eq('updated')
      end
    end

    context 'when the rent does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/"message":"Couldn't find Rent with 'id'=0"/)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}/rents/#{id}" }

    it 'returns status code 204' do
      expect(json['status']).to eq(204)
    end
  end
end
