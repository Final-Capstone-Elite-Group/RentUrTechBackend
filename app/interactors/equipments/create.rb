class Equipments::Create
  include Interactor

  before do
    context.equipment_params ||= context.params
  end

  def call
    create_equipment!
    validate_equipment!
  end

  private

  def create_equipment!
    @equipment = Equipment.new(context.equipment_params) if context.equipment_params
  end

  def validate_equipment!
    if @equipment.save
      context.message = @equipment
      context.status = 201
    else
      context.message = { errors: @equipment.errors.full_messages }
      context.status = 400
    end
  end
end
