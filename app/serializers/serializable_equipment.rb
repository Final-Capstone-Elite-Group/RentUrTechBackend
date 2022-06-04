class SerializableEquipment < JSONAPI::Serializable::Resource
  include Rails.application.routes.url_helpers

  type 'equipment'

  attributes :id, :title, :description, :review, :date_reserved, :duration, :rent_fee, :total_amount_payable,
             :created_at, :updated_at

  attribute :image do
    modify_image
  end

  private

  def modify_image
    return unless @object&.image.attached?

    @object.image.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: image_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(@object.image)
  end
end
