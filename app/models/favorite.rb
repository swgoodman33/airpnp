class Favorite < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :user_id, :presence => true
  validates :listing_id, :presence => true
  validates :listing_id, :uniqueness => { :scope => [:user_id], :message => "You've already favorited this bathroom" }
end
