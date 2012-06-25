class StaticPagesController < ApplicationController
  
  before_filter :soft_check_confirmed
  before_filter :check_admin, only: [:admin, :database_tasks]
  
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
  
  def database_tasks
  end
  
end
