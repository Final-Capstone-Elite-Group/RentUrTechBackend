class Reservations::Destroy
  include Interactor

  before do
    context.reservation_to_destroy ||= context.reservation
  end

  def call
    ActiveRecord::Base.transaction do
      destroy_reservation!
      remove_date_from_equipment!
    end
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

  def remove_date_from_equipment!
    all_dates = context.reservation_to_destroy.equipment.dates_reserved
    all_dates -= [context.reservation_to_destroy.reserved_date.to_s]

    context.reservation_to_destroy.equipment.update!(dates_reserved: all_dates)
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
