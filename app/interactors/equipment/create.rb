class Equipment::Create
  include Interactor

  before do
    context.equipment_params ||= context.params
  end

  def call
    sanitize_params
    create_equipment!
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    handle_errors('There was an error with the image you try to upload')
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def sanitize_params
    context.equipment_params.tap do |hash|
      hash[:user] = user
    end
  end

  def user
    context.user if context.user[:role] == 'admin'
  end

  def create_equipment!
    context.message = Equipment.create!(context.equipment_params) if context.equipment_params

    context.status = 201
  end

  def handle_errors(message, status = 422)
    context.fail!(errors: message, status:)
  end
end
