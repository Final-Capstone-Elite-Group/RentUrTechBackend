class Auth::AuthenticateUser
  include Message

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    auth_token = JsonWebToken.encode(user_id: user.id) if user
    if auth_token
      return {
        message: {
          user: user.slice('id', 'role', 'name', 'username'),
          auth_token:
        },
        status: 200
      }
    end
    {
      message: {
        error: Message.invalid_credentials
      },
      status: 404
    }
  end

  private

  attr_reader :username, :password

  def user
    user = User.find_by(username:)
    return user if !!user&.authenticate(password)
  end
end
