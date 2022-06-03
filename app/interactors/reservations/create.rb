class Reservations::Create
  include Interactor

  before do
    context.reservartions_params ||= context.params
  end

  def call

  end

  private

end
