class EquipmentsController < ApplicationController
  include Response
  skip_before_action :authorize_request, only: %i[index show destroy]

  def index
    ctx = Equipments::Index.call
    render json: ctx.equipments, each_serializer: EquipmentSerializer
  end

  def show; end

  def create
    ctx = Equipments::Create.call(params: equipment_params)
    if ctx[:status] == 201
      render json: ctx[:message], status: ctx[:status], root: 'equipment', serializer: EquipmentSerializer
      return
    end
    json_response(ctx[:message], ctx[:status])
  end

  def destroy
    destroy_ctx = Equipment.find(params[:id])
    if destroy_ctx.destroy
      json_response( { message: 'Equipment succesfully deleted' }, 200)
    end
  end

  private

  def equipment_params
    params.permit(:title, :description, :review, :date_reserved, :duration, :rent_fee, :total_amount_payable, :image)
  end
end
