class BiddingsController < ApplicationController
  before_action :user_authentication, only: :create

  before_action :user_not_bidding_self, only: :create



  def create

    auction_id=params[:auction_id]
    @auction=Auction.find(auction_id)
    @current_bidding=Bidding.new(bidding_params)
    @current_bidding.user=current_user
    @current_bidding.auction=@auction

    # default value for previous bidding in case there is no bidding
    previous_bidding=0
    previous_bidding=@auction.biddings.last.price if @auction.biddings.last
    bidding_price=bidding_params[:price]

    if @current_bidding.price.to_i >= previous_bidding.to_i
      @current_bidding.price=bidding_price
      @current_bidding.save

      if @current_bidding.price.to_i >=@auction.price.to_i
        @auction.above_reserve_price
        @auction.save
      else
        @auction.below_reserve_price
        @auction.save

      end

      flash[:notice] = 'Thanks for your bidding.'
      redirect_to auction_path(auction_id)
    else
      flash[:alert] = 'Your bidding price should be higher than the recent price. '
      redirect_to auction_path(auction_id)


    end


  end

  def index

  end

  private
  def bidding_params
    params.require(:bidding).permit(:price)
  end

  def user_not_bidding_self
    @auction=Auction.find(params[:auction_id])

    if session[:user_id]==@auction.user.id
      redirect_to auction_path(@auction),alert: 'You can not bid yourself'
    end




  end
end
