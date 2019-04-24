class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :hotel_id
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
