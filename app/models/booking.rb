class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :user_id, :presence => true
  validates :listing_id, :presence => true
end
