class AuthenticationController < ApplicationController
  include Response

  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    response = Auth::AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    json_response(response[:message], response[:status])
  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
