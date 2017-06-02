class Listing < ApplicationRecord
  has_many :photos, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  belongs_to :user
  has_many :favorited_users, :through => :favorites, :source => :user
  has_many :booked_users, :through => :bookings, :source => :user

  validates :user_id, :presence => true
  validates :price, :numericality => { :less_than_or_equal_to => 1000, :greater_than_or_equal_to => 0 }
  validates :price, :presence => true
  validates :description, :presence => { :message => "Please provide visitors with a description of what they can expect in your bathroom" }
  validates :availability, :presence => { :message => "Please indicate whether or not visitors can use your bathroom now" }
  validates :address, :presence => { :message => "Please include your address so visitors can find the bathroom that's most geographically convenient" }
  validates :address, :uniqueness => { :scope => [:description], :message => "A bathroom with this address and description has already been listed" }
end
