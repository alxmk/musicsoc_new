namespace :db do
  desc "Purge bookings more than one month old"
  task :purge_bookings => :environment do
    Booking.all.each do |booking|
      booking.destroy unless booking.booking_time > (Date.today - 1.month)
    end
  end
end