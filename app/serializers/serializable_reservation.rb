class SerializableReservation < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers

  type 'reservation'

  attributes :id, :total, :reserved_date, :city, :created_at, :updated_at

  attribute :equipment do
    @object.equipment.slice('id', 'title')
  end

  attribute :equipment_image do
    modify_image
  end

  private

  def modify_image
    equipment = @object.equipment
    return unless equipment.image.attached?

    equipment.image.blob.attributes
      .slice('filename')
      .merge(url: image_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(@object.equipment.image)
  end
end
