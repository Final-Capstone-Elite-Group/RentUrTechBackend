class UsersController < ApplicationController
  include Response
  include Interactor
  skip_before_action :authorize_request, only: :create

  def create
    user_ctx = Users::Create.call(params: user_params)
    json_response({ user: user_ctx.user, token: user_ctx.token }, 201)
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :email)
  end
end
