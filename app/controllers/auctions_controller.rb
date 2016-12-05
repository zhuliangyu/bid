class AuctionsController < ApplicationController
  def new
    @auction=Auction.new
  end

  def create
    @auction=Auction.new(auction_params)

    @auction.user=current_user
    if @auction.save
      redirect_to auctions_path

    else
    redirect_to root_path

    end

  end

  def index
    @auctions=Auction.all


  end

  def show
    @auction=Auction.find(params[:id])
    @bidding=Bidding.new

    @biddings=Bidding.order("Created_at DESC")


  end

  private
  def auction_params
    params.require(:auction).permit(:title, :detail, :endon, :price)
  end
end
