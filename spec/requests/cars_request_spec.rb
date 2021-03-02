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
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /api/v1/cars

  describe 'POST /api/v1/cars' do
    # valid payload

    let(:valid_attributes) do
      { model: 'Kia Rio',
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
        carImg: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'images', 'car.jpeg'), 'image/jpeg', true) }
    end

    context 'when the request is valid' do
      before { post '/api/v1/cars', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a car' do
        expect(json['model']).to eq('Kia Rio')
      end
    end

    context 'when the request is invalid' do
      before do
        post '/api/v1/cars', params: { model: 'Kia Rio',
                                       color: 'White',
                                       bodyStyle: 'Sedan',
                                       pricePerDay: '15',
                                       doors: '4',
                                       luggages: '3',
                                       seats: '5',
                                       engine: 'V',
                                       emissionsClass: 'Euro 6',
                                       transmission: 'Automatic',
                                       rentDeposit: '300' }
      end

      it 'returns status code 422' do
        expect(json['status']).to eq(422)
      end

      it 'returns a validation failure message' do
        expect(json['errors']).to eq(["Carimg can't be blank"])
      end
    end
  end

  # Test suite for PUT /api/v1/cars/:id

  describe 'PUT /api/v1/cars/:id' do
    let(:valid_attributes) { { color: 'Black' } }

    context 'when the record exists' do
      before { put "/api/v1/cars/#{car_id}", params: valid_attributes }

      it 'returns updated color' do
        expect(json['color']).to eq('Black')
      end
    end
  end

  # Test suite for DELETE /api/v1/cars/:id

  describe 'DELETE /api/v1/cars/:id' do
    before { delete "/api/v1/cars/#{car_id}" }

    it 'returns status code deleted' do
      expect(json['status']).to eq('deleted')
    end
  end
end
