class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  belongs_to :amusement_park
  validates_presence_of :name, :thrill_rating, :open

  def self.thrill_sort
    order(thrill_rating: :desc)
  end
end