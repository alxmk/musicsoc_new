class Booking < ActiveRecord::Base
  attr_accessible :booking_time, :cancelled, :user_id
  
  default_scope :order => 'bookings.booking_time'
  
  belongs_to :user
end
