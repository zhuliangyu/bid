class Auction < ApplicationRecord
  include AASM


    belongs_to :user
  has_many :biddings, dependent: :destroy

  aasm :whiny_transitions => false do

    state :draft, :initial => true

    state :published, :reserve_met, :won, :canceled, :reserve_not_met

    event :publish do
      transitions :from => :draft, :to => :published
    end

    event :above_reserve_price do
      transitions :from => :published, :to => :reserve_met
      transitions :from => :reserve_not_met, :to => :reserve_met

    end

    event :below_reserve_price do
      transitions :from => :published, :to => :reserve_not_met
    end

    event :cancel do
      transitions :from => :published, :to => :canceled
    end

    event :top_price do
      transitions :from => :reserve_met, :to => :won
    end


  end


end
