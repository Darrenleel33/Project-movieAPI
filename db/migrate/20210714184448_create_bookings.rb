class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :movie_id
      t.datetime :showtime
      t.integer :seats_available
    end
  end
end
