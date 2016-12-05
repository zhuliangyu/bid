class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  private

  def user_sign_in?
    session[:user_id] ? true : false

  end
  helper_method :user_sign_in?

  def current_user
    @user||=User.find(session[:user_id]) if user_sign_in?
  end

  helper_method :current_user


end
