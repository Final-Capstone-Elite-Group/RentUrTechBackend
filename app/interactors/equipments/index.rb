class Equipments::Index
  include Interactor

  def call
    context.equipments = query&.reorder(order)
  end

  private

  def query
    @equipments = Equipment.all
  end

  def order
    {
      created_at: :desc
    }
  end
end
