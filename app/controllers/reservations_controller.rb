class ReservationsController < ApplicationController
  def index; end

  def create
    reservation_ctx = Reservations::Create.call({
      params: reservartions_params,
      user: @current_user  })

    json_response({ reservation: reservation_ctx.reservation })
  end

  def destroy; end

  private

  def reservartions_params
    params.require(:reservation).permit(:total, :reserved_date, :city)
  end
end
