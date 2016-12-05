class BiddingsController < ApplicationController
  def create

    auction_id=params[:auction_id]
    @auction=Auction.find(auction_id)
    @bidding=Bidding.new(bidding_params)
    @bidding.user=current_user
    @bidding.auction=@auction
    if @bidding.save
      redirect_to auction_path(auction_id)
    else
      redirect_to root_path

    end


  end

  def index

  end

  private
  def bidding_params
    params.require(:bidding).permit(:price)
  end
end
