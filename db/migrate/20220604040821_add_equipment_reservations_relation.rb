class AddEquipmentReservationsRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment, :reservation, foreign_key: true, index: true
  end
end
