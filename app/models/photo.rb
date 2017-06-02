class Photo < ApplicationRecord
  belongs_to :listing

  validates :listing_id, :presence => true
  validates :image_url, :presence => { :message => "Please include a photo so visitors can understand what they can expect" }
end
