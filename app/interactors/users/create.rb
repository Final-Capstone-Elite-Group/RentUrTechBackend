class Users::Create
  include Interactor

  before do
    context.user_params ||= params[:user]
  end

  def call
    context.user = create_user!
    context.token = JsonWebToken.encode(user_id: @user.id) if @user
  end

  def create_user!
    @user = User.create(context.user_params) if context.user_params
  end
end
