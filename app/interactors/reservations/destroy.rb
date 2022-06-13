class Reservations::Destroy
  include Interactor

  before do
    context.reservation_to_destroy ||= context.reservation
  end

  def call
    valid_to_destroy?
    destroy_reservation!
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def destroy_reservation!
    context.reservation_to_destroy.destroy!

    context.message = { data: 'Reservation destroyed successfully' }
    context.status = 200
  end

  def valid_to_destroy?
    return if context.reservation_to_destroy && context.reservation_to_destroy.user.id == context.user.id

    raise 'Not allowed to destroy this Reservation'
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
