class Equipment < ApplicationRecord
  has_many :equipment_reservations, dependent: :destroy
  has_many :reservations, through: :equipment_reservations
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end
