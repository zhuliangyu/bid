FactoryGirl.define do
  factory :bidding do
    price 1
    association :user, factory: :user
    association :auction, factory: :auction
  end
end


# FactoryGirl.build(:auction).valid?
