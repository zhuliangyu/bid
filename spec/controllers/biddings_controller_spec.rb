require 'rails_helper'

RSpec.describe BiddingsController, type: :controller do

  describe "POST #create" do
    context ' when user log in' do


      user = FactoryGirl.create(:user)
      auction=FactoryGirl.create(:auction)
      it "should create a new bidding" do
        before_count=Bidding.count #0

        post(:create,
             session: {'user_id' => user.id},
             params: {
                 bidding: FactoryGirl.attributes_for(:bidding),
                 auction_id: Auction.last.id

             })

        after_count=Bidding.count #1

        expect(before_count+1).to eq(after_count)

      end


    end

    context ' when user not log in' do

      it "should create a new bidding" do
        before_count=Bidding.count #0

        post(:create,
             params: {
                 bidding: FactoryGirl.attributes_for(:bidding),
                 auction_id: Auction.last.id

             })

        after_count=Bidding.count #1

        expect(before_count).to eq(after_count)



      end

    end


  end


end
