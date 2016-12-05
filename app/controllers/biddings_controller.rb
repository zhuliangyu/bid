class BiddingsController < ApplicationController
  def create

    auction_id=params[:auction_id]
    @auction=Auction.find(auction_id)
    @current_bidding=Bidding.new(bidding_params)
    @current_bidding.user=current_user
    @current_bidding.auction=@auction
    previous_bidding=@auction.biddings.last.price
    bidding_price=bidding_params[:price]

    if @current_bidding.price.to_i>previous_bidding.to_i
      @current_bidding.price=bidding_price
      @current_bidding.save
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
end
