class BiddingsController < ApplicationController
  def create

    auction_id=params[:auction_id]
    @auction=Auction.find(auction_id)
    @bidding=Bidding.new(bidding_params)
    @bidding.user=current_user
    @bidding.auction=@auction

    bidding_price=bidding_params[:price]

    if @auction.price<bidding_price.to_i
      @auction.price=bidding_price
      @auction.save
      @bidding.save
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
