require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /api/auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/api/auth/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        json_response = JSON.parse(response.body)

        expect(json_response['auth_token']).not_to be_nil
      end
    end
  end
end
