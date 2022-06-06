class EquipmentsController < ApplicationController
  include Response
  skip_before_action :authorize_request, only: %i[index show]

  def index
    ctx = Equipments::Index.call

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    render jsonapi: ctx.equipments, class: { Equipment: SerializableEquipment }
  end

  def show
    ctx = Equipments::Show.call(params:)

    return json_response({ error: ctx[:error] }, ctx[:status]) if ctx.failure?

    render jsonapi: ctx.equipment, class: { Equipment: SerializableEquipment }
  end

  def create
    ctx = Equipments::Create.call({
                                    params: equipment_params,
                                    user: @current_user
                                  })

    return json_response({ errors: ctx[:errors] }, ctx[:status]) if ctx.failure?

    render jsonapi: ctx[:message], status: ctx[:status], class: { Equipment: SerializableEquipment }
  end

  def destroy
    return json_response({ error: 'Unauthorized user' }, 401) unless @current_user.role == 'admin'

    destroy_ctx = Equipment.find(params[:id])
    json_response({ message: 'Equipment succesfully deleted' }, 200) if destroy_ctx.destroy
  end

  private

  def equipment_params
    params.permit(:title, :description, :review, :duration, :rent_fee, :total_amount_payable, :image)
  end
end
