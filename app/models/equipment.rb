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
end
