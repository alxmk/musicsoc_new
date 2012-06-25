class BookingsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :hard_check_confirmed
  
  def make
    if current_user.already_booked?
      flash[:error] = "You've already booked a session this week!"
      redirect_to bookings_path
    else
      @booking = current_user.bookings.build
      @booking.booking_time = params[:booking_time]
      if @booking.save
        flash[:success] = "Booking made!"
        redirect_to bookings_path
      else
        flash[:error] = "Something went wrong :( contact the MusicSoc committee asap!"
        redirect_to bookings_path
      end
    end
  end
  
  def remove
    @booking = Booking.find(params[:id])
    if !@booking.cancelled?
      @booking.toggle!(:cancelled)
      flash[:success] = "Booking removed!"
      redirect_to bookings_path
    else
      flash[:error] = "Something went wrong :( contact the MusicSoc committee asap!"
      redirect_to bookings_path
    end
  end
  
  def index
    @title = "Bookings"
    @date = Date.today
  end
  
end

