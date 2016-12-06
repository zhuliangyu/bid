class AuctionsController < ApplicationController
  before_action :user_authentication, only: [:new,:create]


  def new
    @auction=Auction.new
  end

  def create
    @auction=Auction.new(auction_params)

    # transfer date from datepicker to datetime
    @auction.endon= Date.strptime(params[:auction][:endon], "%m/%d/%Y").strftime("%Y/%m/%d %H:%M:%S")

    @auction.user=current_user
    if @auction.save
      redirect_to auctions_path
    else
      redirect_to root_path
    end

  end

  def index
    @auctions=Auction.order("created_at DESC")
  end

  def show
    @auction=Auction.find(params[:id])
    @current_bidding=Bidding.new

    @biddings=Bidding.where(auction: @auction).order(created_at: :desc)


  end

  private
  def auction_params
    params.require(:auction).permit(:title, :detail, :endon, :price)
  end
end
