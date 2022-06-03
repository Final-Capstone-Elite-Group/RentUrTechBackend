class EquipmentsController < ApplicationController
  include Response

  skip_before_action :authorize_request, only: %i[index show]

  def index
    ctx = Equipments::Index.call
    render json: ctx.equipments, each_serializer: EquipmentSerializer
  end

  def show; end

  def create; end

  def destroy; end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :description, :review, :date_reserved, :duration, :rent_fee, :total_amount_payable, :image)
  end
end
