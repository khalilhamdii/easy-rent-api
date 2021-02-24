require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  # initialize test data

  let!(:cars) { create_list(:car, 10) }

  let(:car_id) { cars.first.id }

  # Test suite for GET /api/v1/cars
  describe 'GET /api/v1/cars' do
    # make HTTP get request before each example
    before { get '/api/v1/cars' }

    it 'returns cars' do
      # Note `json` is a custom helper to parse JSON responses
      puts json.size
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  #   # Test suite for POST /api/v1/cars

  #   describe 'POST /api/v1/cars' do
  #     include Rack::Test::Methods
  #     include ActionDispatch::TestProcess
  #     # valid payload

  #     let(:valid_attributes) {{ model: 'Kia Rio',
  #       color: 'White',
  #       bodyStyle: 'Sedan',
  #       pricePerDay: '15',
  #       doors: '4',
  #       luggages: '3',
  #       seats: '5',
  #       engine: 'V',
  #       emissionsClass: 'Euro 6',
  #       transmission: 'Automatic',
  #       rentDeposit: '300',
  #       carImg: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'images', 'car.jpeg'), 'image/jpeg', true)
  #  } }

  #     context 'when the request is valid' do

  #       before { post '/api/v1/cars', params: valid_attributes }

  #       it 'creates a car' do
  #         expect(json['car']['model']).to eq('Kia Rio')

  #       end

  #       it 'returns status code 201' do
  #         expect(json['status']).to eq('created')

  #       end

  #     end

  #     context 'when the request is invalid' do

  #       before { post '/api/v1/cars', params: { model: 'ki' } }

  #       it 'returns status code 422' do
  #         expect(json['status']).to eq(422)

  #       end

  #       it 'returns a validation failure message' do
  #         expect(json['errors']).to eq(["Password can't be blank","Username is too short (minimum is 4 characters)","Email can't be blank"])

  #       end

  #     end

  #   end

  # # Test suite for PUT /api/v1/cars/:id

  # describe 'PUT /api/v1/cars/:id' do

  #   let(:valid_attributes) { {user: { role: 'ADMIN' }} }

  #   context 'when the record exists' do

  #     before { put "/api/v1/cars/#{user_id}", params: valid_attributes }

  #     it 'returns status code updated' do

  #       expect(json["status"]).to eq('updated')

  #     end

  #   end

  # end

  # # Test suite for DELETE /api/v1/cars/:id

  # describe 'DELETE /api/v1/cars/:id' do

  #   before { delete "/api/v1/cars/#{user_id}" }

  #   it 'returns status code 204' do

  #     expect(json['status']).to eq(204)

  #   end

  # end
end
