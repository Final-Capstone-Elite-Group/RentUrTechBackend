class UsersController < ApplicationController
  include Response
  include Interactor
  skip_before_action :authorize_request, only: :create

  def create
    context = Users::Create.call(params: user_params)
    render json: context.message, :except => [:password_digest], status: context.status
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :email)
  end
end
