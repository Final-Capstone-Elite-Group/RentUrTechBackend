class SerializableReservation < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers

  type 'reservation'

  attributes :id, :total, :reserved_date, :city, :created_at, :updated_at

  attribute :equipment do
    @object.equipment.slice('id', 'title', 'url', 'duration')
  end

  attribute :reserved_date do
    @object.reserved_date.strftime('%Y-%m-%d')
  end
end
