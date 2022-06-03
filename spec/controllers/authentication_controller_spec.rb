require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST login' do
    let!(:user) { create(:user) }
    let(:params) do
      {
        username: user.username,
        password: user.password
      }
    end

    context 'When request is valid' do
      it 'returns an authentication token' do
        post('/login', params: params)
        json_response = JSON.parse(response.body)
        byebug
        expect(json_response['auth_token']).not_to be_nil
      end
    end
  end
end
