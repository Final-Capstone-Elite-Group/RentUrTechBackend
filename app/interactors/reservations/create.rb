class Reservations::Create
  include Interactor

  before do
    context.reservations_params ||= context.params
    context.reserved_date ||= context.reservations_params[:reserved_date]
  end

  def call
    ActiveRecord::Base.transaction do
      validate_reservation!
      sanitize_params!
      create_reservation!
    end
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  ## Transforms date to UTC so no hour is stored in the database

  def sanitize_params!
    context.reservations_params[:reserved_date] = Time.zone.parse(context.reservations_params[:reserved_date]).strftime('%Y-%m-%d')
  end

  def validate_reservation!
    reserved_date_time_zoned = Time.zone.parse(context.reservations_params[:reserved_date])
    date_now_time_zoned = Time.zone.parse(Time.now.strftime('%Y-%m-%d'))

    raise "Can't be reserved in the past" if context.reservations_params[:reserved_date] && reserved_date_time_zoned < date_now_time_zoned
  end

  def create_reservation!
    if context.reservations_params
      @reservation = Reservation.create!(context.reservations_params.merge(user_id: context.user.id))
    end

    context.message = @reservation
    context.status = 200
  end

  def handle_errors(message)
    context.message = { errors: message }
    context.status = 422
  end
end
