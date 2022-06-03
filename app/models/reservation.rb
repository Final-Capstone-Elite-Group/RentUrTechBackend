class Reservation < ApplicationRecord
  belongs_to :user
  has_many :equipment_reservations, dependent: :destroy
  has_many :equipments, through: :equipment_reservations
end
