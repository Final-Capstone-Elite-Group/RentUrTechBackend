class Auth::AuthenticateUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :username, :password

  def user
    user = User.find_by(username:)
    return user if !!user&.authenticate(password)
  end
end
