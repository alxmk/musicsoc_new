require 'spec_helper'

describe Booking do
  
  let(:user) { FactoryGirl.create(:user) }
  
  before do
    @booking = user.bookings.create(booking_time: Time.now.utc)
  end
  
  subject { @booking }
  
  it { should respond_to(:user) }
  it { should respond_to(:booking_time) }
  it { should respond_to(:cancelled ) }
  
end
