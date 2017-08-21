class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:landing, :login, :attempt_login, :logout]

  def menu
  end

  def login
      unless session[:user_id] == nil
        redirect_to("/home/dashboard")
      end
  end

  def landing
    unless session[:user_id] == nil
      redirect_to("/home/dashboard")
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Logged In."
      redirect_to("/home/dashboard")
    else
      flash.now[:notice] = "Invalid Entry."
      render("landing")
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out."
    redirect_to root_path
  end

  private

end
