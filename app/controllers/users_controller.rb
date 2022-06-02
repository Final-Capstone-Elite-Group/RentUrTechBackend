class UsersController < ApplicationController
  include Interactor

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name.titlecase} to the LifeStyle Articles app"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role, :email)
  end
end
