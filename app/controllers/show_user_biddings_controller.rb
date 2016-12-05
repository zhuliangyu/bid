class ShowUserBiddingsController < ApplicationController
  before_action :user_authentication


  def index
    @user=User.find(params[:user_id])
    @biddings= @user.biddings


  end
end
