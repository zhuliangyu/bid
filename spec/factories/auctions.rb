FactoryGirl.define do
  factory :auction do
    title "MyString"
    detail "MyString"
    endon "12/05/2016"
    price 1
    association :user, factory: :user
  end
end
