class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_admin
  
  def index
    @title = "User List"
    @users = User.all
  end
  
  def confirm
    @user = User.find(params[:id])
    if !@user.confirmed?
      @user.toggle!(:confirmed)
    end
    flash[:success] = "User #{@user.email} confirmed!"
    redirect_to users_path
  end
  
  def unconfirm
    @user = User.find(params[:id])
    if @user.confirmed?
      @user.toggle!(:confirmed)
    end
    flash[:success] = "User #{@user.email} unconfirmed!"
    redirect_to users_path
  end
  
  def adminify
    @user = User.find(params[:id])
    if !@user.admin?
      @user.toggle!(:admin)
    end
    flash[:success] = "User #{@user.email} given admin privileges!"
    redirect_to users_path
  end
  
  def unadminify
    @user = User.find(params[:id])
    if @user.admin?
      @user.toggle!(:admin)
    end
    flash[:success] = "Removed admin privileges for #{@user.email}!"
    redirect_to users_path
  end
  
  def initialise_database
    if current_user.email == "su9music@bath.ac.uk"
      Booking.all.each { |b| b.destroy }
      User.all.each { |u| u.destroy unless u.email == "su9music@bath.ac.uk" }
      flash[:success] = "Database reset."
    else
      flash[:error] = "Don't do that."
    end
    redirect_to database_tasks_path
  end
  
  def purge_bookings
    Booking.all.each { |b| b.destroy unless b.booking_time > (Date.today - 1.month) }
    flash[:success] = "Old bookings successfully purged."
    redirect_to database_tasks_path
  end
  
  def purge_unconfirmed
    User.find_all_by_confirmed(false).each { |u| u.destroy }
    flash[:success] = "Unconfirmed users successfully purged."
    redirect_to database_tasks_path
  end
  
  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end
  
end
