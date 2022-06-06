class ReservationsController < ApplicationController
  include Response

  def index; end

  def create
    context = Reservations::Create.call({
                                          params: create_params,
                                          user: @current_user
                                        })

    json_response(context.message, context.status)
  end

  def destroy; end

  private

  def create_params
    params.require(:reservation).permit(reservations_params)
  end

  def reservations_params
    %i[total reserved_date city equipment_id]
  end
end
