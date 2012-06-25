class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def check_admin
    if !current_user.confirmed? || !current_user.admin?
      flash[:error] = "Only confirmed site admins may access this area."
      redirect_to root_path
    end
  end
  
end
