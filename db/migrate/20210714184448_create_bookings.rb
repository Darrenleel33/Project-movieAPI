class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :showtime
      t.integer :seats_available
    end
  end
end
