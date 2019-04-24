class CreateBookingDates < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_dates do |t|
      t.date :reserved_date
      t.integer :booking_id

      t.timestamps
    end
  end
end
