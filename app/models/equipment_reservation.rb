class EquipmentReservation < ApplicationRecord
  belongs_to :reservation
  belongs_to :equipment
end
