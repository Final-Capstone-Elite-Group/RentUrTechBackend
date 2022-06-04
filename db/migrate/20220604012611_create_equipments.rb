class CreateEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :description
      t.string :review
      t.datetime :date_reserved
      t.integer :duration
      t.decimal :rent_fee
      t.decimal :total_amount_payable
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
