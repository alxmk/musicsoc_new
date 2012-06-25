class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.datetime :booking_time
      t.boolean :cancelled, default: false

      t.timestamps
    end
    
    add_index :bookings, :booking_time
    add_index :bookings, :cancelled
  end
end
