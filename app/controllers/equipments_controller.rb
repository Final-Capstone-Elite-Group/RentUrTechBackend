class EquipmentsController < ApplicationController
  include Response
  skip_before_action :authorize_request, only: %i[index show destroy]

  def index; end

  def show; end

  def create; end

  def destroy
    destroy_ctx = Equipment.find(params[:id]).destroy
    json_response({ equipment_destroy: destroy_ctx }, 204)
  end
end
