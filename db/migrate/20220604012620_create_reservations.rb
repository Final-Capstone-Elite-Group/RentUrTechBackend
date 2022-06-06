class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.decimal :total
      t.datetime :reserved_date
      t.string :city
      t.references :equipment, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
