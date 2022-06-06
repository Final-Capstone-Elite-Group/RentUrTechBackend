class ReservationsController < ApplicationController
  include Response

  def index
    ctx = Reservations::Index.call({ params: { user: @current_user } })

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    render jsonapi: ctx.reservations, class: { Reservation: SerializableReservation }
  end

  def create
    context = Reservations::Create.call({
                                          params: create_params,
                                          user: @current_user
                                        })

    json_response(context.message, context.status)
  end

  def destroy
    reservation = Reservation.find(params[:id])

    context = Reservations::Destroy.call({
                                           reservation:,
                                           user: @current_user
                                         })

    json_response(context.message, context.status)
  end

  private

  def create_params
    params.require(:reservation).permit(reservations_params)
  end

  def reservations_params
    %i[total reserved_date city equipment_id]
  end
end
