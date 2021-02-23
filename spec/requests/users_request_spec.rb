require 'rails_helper'
include BCrypt
RSpec.describe 'Users API', type: :request do
  # initialize test data

  let!(:users) { create_list(:user, 10) }

  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe 'GET /users' do
    # make HTTP get request before each example
    before { get '/users' }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json["users"]).not_to be_empty
      expect(json["users"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id

  describe 'GET /users/:id' do

    before { get "/users/#{user_id}" }

    context 'when the record exists' do

      it 'returns the user' do

        expect(json["user"]).not_to be_empty

        expect(json["user"]['id']).to eq(user_id)

      end

      it 'returns status code 200' do

        expect(response).to have_http_status(200)

      end

    end

    context 'when the record does not exist' do

      let(:user_id) { 100 }

      it 'returns status code 404' do

        expect(response).to have_http_status(404)

      end

      it 'returns a not found message' do

        expect(response.body).to match(/Couldn't find User with 'id'=100/)

      end

    end

  end

  # Test suite for POST /users

  describe 'POST /users' do

    # valid payload

    let(:valid_attributes) {{user: { userName: 'User',
      email: 'user@user.com',
      password: 'password',
      password_confirmation: 'password',
      role: 'USER' }} }

    context 'when the request is valid' do

      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['user']['userName']).to eq('User')

      end

      it 'returns status code 201' do
        expect(json['status']).to eq('created')

      end

    end

    context 'when the request is invalid' do

      before { post '/users', params: {user:{ userName: 'da' }} }

      it 'returns status code 422' do
        expect(json['status']).to eq(422)

      end

      it 'returns a validation failure message' do
        expect(json['errors']).to eq(["Password can't be blank","Username is too short (minimum is 4 characters)","Email can't be blank"])

      end

    end

  end

  # Test suite for PUT /users/:id

  describe 'PUT /users/:id' do

    let(:valid_attributes) { {user: { role: 'ADMIN' }} }

    context 'when the record exists' do

      before { put "/users/#{user_id}", params: valid_attributes }

      it 'returns status code updated' do

        expect(json["status"]).to eq('updated')

      end

    end

  end

  # Test suite for DELETE /users/:id

  describe 'DELETE /users/:id' do

    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do

      expect(json['status']).to eq(204)

    end

  end
end
