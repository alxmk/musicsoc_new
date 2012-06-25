class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def soft_check_confirmed
    if user_signed_in? && !current_user.confirmed?
      flash.now[:notice] = "You are registered but not confirmed, please contact MusicSoc to confirm your account"
    end
  end
  
  def hard_check_confirmed
    if user_signed_in? && !current_user.confirmed?
      flash[:notice] = "You are registered but not confirmed, please contact MusicSoc to confirm your account"
      redirect_to root_path
    end
  end
  
  def check_admin
    if !current_user.confirmed? || !current_user.admin?
      flash[:error] = "Only confirmed site admins may access this area."
      redirect_to root_path
    end
  end
  
end
