class Equipment::Show
  include Interactor

  def call
    context.equipment = query
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    @equipment = Equipment.find(context.params[:id])
  end

  def handle_errors(message, status = 404)
    context.fail!(error: message, status:)
  end
end
