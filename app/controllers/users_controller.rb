class UsersController < ApplicationController
  include Interactor

  def create
    user, token = Users::Create.call(params: user_params)

    json_response({ user: @user, token: token: token })
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role, :email)
  end
end
