require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  # describe "GET #new" do
  #   context ' when user log in' do
  #     user = FactoryGirl.create(:user)
  #     it "redirect to new template" do
  #       get(:new, session: {'user_id' => user.id})
  #       expect(response).to render_template(:new) # wraps assert_redirected_to
  #     end
  #   end
  #
  #   context ' when user not log in' do
  #     it "redirect to home page" do
  #       get(:new)
  #       expect(response).to redirect_to(root_path) # wraps assert_redirected_to
  #     end
  #   end
  # end

  describe "POST #create" do
    # context ' when user log in' do
    #   user = FactoryGirl.create(:user)
    #   it "should create a new auction" do
    #     before_count=Auction.count #0
    #
    #     post(:create, session: {'user_id' => user.id}, params: {auction: FactoryGirl.attributes_for(:auction)})
    #
    #     after_count=Auction.count #1
    #
    #     expect(before_count+1).to eq(after_count)
    #
    #   end
    #
    #
    # end

    context ' when user not log in' do

      it "should create a new auction" do
        before_count=Auction.count #0

        post(:create, params: {auction: FactoryGirl.attributes_for(:auction)})

        after_count=Auction.count #

        expect(before_count).to eq(after_count)


      end

    end


  end




end
