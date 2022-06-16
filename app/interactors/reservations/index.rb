class Reservations::Index
  include Interactor

  def call
    context.reservations = query&.reorder(order)
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def query
    @reservations = context.params[:user].reservations.includes(:equipment)
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
