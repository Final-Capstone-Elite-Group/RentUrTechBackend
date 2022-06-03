class Users::Create
  include Interactor

  before do
    context.user_params ||= context.params
  end

  def call
    create_user!
    validate_user!
  end

  private

  def create_user!
    @user = User.new(context.user_params) if context.user_params
  end

  def validate_user!
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)
      context.message = {
        user: @user,
        token:
      }
      context.status = 201
    else
      context.message = { errors: @user.errors.full_messages }
      context.status = 400
    end
  end
end
