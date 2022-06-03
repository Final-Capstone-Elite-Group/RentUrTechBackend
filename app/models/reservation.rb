class Reservation < ApplicationRecord
  has_many :equipment_reservations, dependent: :destroy
  has_many :equipments, through: :equipment_reservations
end
