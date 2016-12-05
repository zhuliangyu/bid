class SessionsController < ApplicationController
  def new

  end

  def create
    user=User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to root_path, notice:"You successfuly log in"
    else
      redirect_to root_path, alert:"You failure log in"
    end

  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path,notice: "You successfuly log out"

  end

end
