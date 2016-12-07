module Auctions
  class PublishingAuction
    def call(auction_id)
      auction=Auction.find(auction_id)
      auction.publish
      auction.save
      redirect_to auction
    end

  end
end