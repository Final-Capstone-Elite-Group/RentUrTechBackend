class EquipmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :review, :date_reserved, :duration, :rent_fee, :total_amount_payable, :image, :created_at, :updated_at

  def image
    return unless object.image.attached?

    object.image.blob.attributes
    .slice('filename', 'byte_size')
    .merge(url: image_url)
    .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  private

  def image_url
    url_for(object.image)
  end
end
