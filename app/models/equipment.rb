class Equipment < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validate :acceptable_image
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }

  def acceptable_image
    return unless images.first&.attached?

    validate_images!
  end

  private

  def validate_images!
    acceptable_types = ["image/jpeg", "image/png"]
    images.each do |img|
      unless img.byte_size <= 1.megabyte
        errors.add(:img, "is too big")
      end

      unless acceptable_types.include?(img.content_type)
        errors.add(:img, "must be a JPEG or PNG")
      end
    end
  end
end
