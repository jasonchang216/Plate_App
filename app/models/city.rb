class City < ActiveRecord::Base

  has_many :restaurants
  has_many :ratings

  scope :sorted, lambda { order("city_name ASC")}

end
