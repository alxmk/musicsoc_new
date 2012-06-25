class StaticPagesController < ApplicationController
  
  before_filter :check_confirmed
  before_filter :check_admin, only: :admin
  
  def home
  end

  def faq
  end
  
  def about
  end
  
  def contact
  end
  
  def admin
  end
  
  private
    
    def check_confirmed
      if user_signed_in? && !current_user.confirmed?
        flash.now[:notice] = "You are registered but not confirmed, please contact MusicSoc to confirm your account"
      end
    end
end
