class Users::Create
  include Interactor

  before do
    context.user_params ||= context.params
  end

  def call
    ActiveRecord::Base.transaction do
      create_user!
      create_token!
    end
    rescue StandardError => e
      handle_errors(e.message)
  end

  private

  def create_user!
    @user = User.create!(context.user_params) if context.user_params
  end

  def create_token!
    token = JsonWebToken.encode(user_id: @user.id)
    context.message = {
      user: @user,
      token:
    }
    context.status = 201
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
