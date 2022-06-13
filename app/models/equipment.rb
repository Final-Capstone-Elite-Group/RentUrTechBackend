class Equipment < ApplicationRecord
  after_create_commit :actions_after_create
  before_destroy :purge_image

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 200, maximum: 2000 }
  validates :review, presence: true
  validates :duration, presence: true
  validates :rent_fee, presence: true
  validates :total_amount_payable, presence: true
  validates :image, presence: true
  validate :proper_numeric_inputs?

  private

  def purge_image
    image.purge
  end

  def actions_after_create
    update_columns(url: image_url)
  end

  def image_url
    url_for(image)
  end

  def proper_numeric_inputs?
    errors.add(:rent_fee, 'should exist and be greater than or equal to 0') unless rent_fee && rent_fee >= 0

    unless total_amount_payable && total_amount_payable >= 0
      errors.add(:total_amount_payable, 'should exist and be greater than or equal to 0')
    end

    errors.add(:duration, 'should exist and be greater than 0') unless duration&.positive?
  end
end
