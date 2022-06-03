class Equipment < ApplicationRecord
  has_one_attached :image
  has_many :equipment_reservations, dependent: :destroy
  has_many :reservations, through: :equipment_reservations
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 200, maximum: 2000 }
  validates :review, presence: true
  validates :date_reserved, presence: true
  validates :duration, presence: true
  validates :rent_fee, presence: true
  validates :total_amount_payable, presence: true
  validates :image, presence: true
end
