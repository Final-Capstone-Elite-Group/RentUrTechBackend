class Reservations::Create
  include Interactor

  before do
    context.user_params ||= context.params
  end

  def call
    context.reservation
  end

  private

end
