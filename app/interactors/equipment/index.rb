class Equipment::Index
  include Interactor

  def call
    context.equipments = query&.reorder(order)
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    @equipments = Equipment.all.with_attached_image
  end

  def order
    {
      created_at: :desc
    }
  end

  def handle_errors(message, status = 422)
    context.fail!(errors: message, status:)
  end
end
