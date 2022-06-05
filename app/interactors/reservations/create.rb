class Reservations::Create
  include Interactor

  before do
    context.reservations_params ||= context.params
  end

  def call
    ActiveRecord::Base.transaction do
      create_reservation!
      update_equipment!
    end
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def create_reservation!
    if context.reservations_params
      @reservation = Reservation.create!(context.reservations_params.merge(user_id: context.user.id))
    end
    context.message = @reservation
    context.status = 200
  end

  def update_equipment!
    return if @reservation.nil?
    equipment = Equipment.find(context.params[:equipment_id])
    equipment&.dates_reserved.push(@reservation.reserved_date.to_datetime)
    equipment.save!
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
