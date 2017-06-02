class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :listings, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorite_listings, :through => :favorites, :source => :listing
  has_many :booked_listings, :through => :bookings, :source => :listing

  validates :name, :presence => { :message => "Please include your first and last name" }
  validates :name, :uniqueness => { :scope => [:email], :message => "A user with this name and email has already been created" }
end
