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
  
  private
  
  def check_admin
    if !current_user.confirmed? || !current_user.admin?
      flash[:error] = "Only confirmed site admins may access this area."
      redirect_to root_path
    end
  end
  
end
