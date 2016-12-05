class Auction < ApplicationRecord
  belongs_to :user
  has_many :biddings, dependent: :destroy
end
