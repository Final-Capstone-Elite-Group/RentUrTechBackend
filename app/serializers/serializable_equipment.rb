class SerializableEquipment < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers

  type 'equipment'

  attributes :id, :title, :description, :review, :duration, :rent_fee, :total_amount_payable,
             :created_at, :updated_at

  attribute :image do
    { url: @object.url }
  end

  attribute :dates_reserved do
    Reservation.all_reserved_dates(@object.id).map { |reserved_date| reserved_date.strftime('%Y-%m-%d') }
  end
end
