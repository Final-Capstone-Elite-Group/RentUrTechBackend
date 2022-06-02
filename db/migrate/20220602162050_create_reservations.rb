class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.float :total
      t.datetime :reserved_date
      t.string :city
      t.integer :user_id

      t.timestamps
    end
  end
end
