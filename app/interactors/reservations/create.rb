class Reservations::Create
  include Interactor

  before do
    context.reservations_params ||= context.params
  end

  def call
    create_reservation!
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def create_reservation!
    if context.reservations_params
      context.message = Reservation.create!(context.reservations_params.merge(user_id: context.user.id))
    end

    context.status = 200
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
