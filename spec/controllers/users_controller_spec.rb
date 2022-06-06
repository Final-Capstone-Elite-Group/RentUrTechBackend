require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'POST create' do
    let(:params) do
      {
        user: {
          name: 'Jose',
          username: 'rails_backend',
          email: 'jose@testing.com',
          password: 'test123'
        }
      }
    end

    context 'should create user' do
      it 'success' do
        post('/signup', params:)
        json_response = JSON.parse(response.body)
        user_db = User.last

        expect(response.status).to eq(201)
        expect(json_response['user']['id']).to eq(user_db.id)
        expect(json_response['user']['name']).to eq(params[:user][:name])
        expect(json_response['user']['username']).to eq(params[:user][:username])
        expect(json_response['user']['email']).to eq(params[:user][:email])
      end
    end

    context 'should not create user' do
      it 'failed' do
        post('/signup', params: params.merge(user: { email: 'blabla' }))
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(422)
        expect(json_response['errors']).to eq("Validation failed: Password can't be blank, Email is invalid")
      end
    end
  end
end
