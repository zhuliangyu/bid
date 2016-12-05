class PublishingsController < ApplicationController

  def create
    id=params[:auction_id]
    auction=Auction.find(id)
      auction.publish
      auction.save


    redirect_to auction


  end

end
