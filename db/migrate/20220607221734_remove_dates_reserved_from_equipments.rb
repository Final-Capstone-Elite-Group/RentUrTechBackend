class RemoveDatesReservedFromEquipments < ActiveRecord::Migration[7.0]
  def change
    remove_column :equipment, :dates_reserved, :text
  end
end
