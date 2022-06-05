class Reservations::Destroy
  include Interactor

  before do
    context.reservation_to_destroy ||= context.reservation
  end

  def call
    destroy_reservation!
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def destroy_reservation!
    if valid_to_destroy?
      context.reservation_to_destroy.destroy!

      context.message = { data: 'Reservation destroyed successfully' }
      context.status = 200
    else
      context.message = { data: 'Not allowed to destroy this Reservation' }
      context.status = 422
    end
  end

  def valid_to_destroy?
    context.reservation_to_destroy && context.reservation_to_destroy.user.id == context.user.id
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
