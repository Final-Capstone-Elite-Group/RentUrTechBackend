class Reservations::Create
  include Interactor

  before do
    context.reservations_params ||= context.params
    context.reserved_date ||= context.reservations_params[:reserved_date]
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
    reserved_date_time_zoned = Time.zone.parse(context.reserved_date)
    date_now_time_zoned = Time.zone.parse(DateTime.now.to_s)

    raise "Can't reserved in the past" if context.reserved_date && reserved_date_time_zoned < date_now_time_zoned

    if context.reservations_params
      @reservation = Reservation.create!(context.reservations_params.merge(user_id: context.user.id))
    end

    context.message = @reservation
    context.status = 200
  end

  def update_equipment!
    return if @reservation.nil?

    equipment = Equipment.find(context.params[:equipment_id])
    equipment.dates_reserved.push(@reservation.reserved_date.to_datetime.change(usec: 0))
    equipment.save!
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
