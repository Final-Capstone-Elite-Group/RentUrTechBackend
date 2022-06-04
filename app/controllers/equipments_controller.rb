class EquipmentsController < ApplicationController
  include Response
  skip_before_action :authorize_request, only: %i[index show]

  def index
    ctx = Equipments::Index.call

    return json_response(ctx[:errors], ctx[:status]) if ctx.failure?

    render jsonapi: ctx.equipments, class: { Equipment: SerializableEquipment }
  end

  def show; end

  def create
    ctx = Equipments::Create.call({
                                    params: equipment_params,
                                    user: @current_user
                                  })

    return json_response(ctx[:errors], ctx[:status]) if ctx.failure?

    render jsonapi: ctx[:message], status: ctx[:status], class: { Equipment: SerializableEquipment }
  end

  def destroy
    destroy_ctx = Equipment.find(params[:id])
    json_response({ message: 'Equipment succesfully deleted' }, 200) if destroy_ctx.destroy
  end

  private

  def equipment_params
    params.permit(:title, :description, :review, :date_reserved, :duration, :rent_fee, :total_amount_payable, :image)
  end
end
