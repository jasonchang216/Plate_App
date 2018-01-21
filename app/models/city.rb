class City < ActiveRecord::Base

  has_many :ratings
  has_many :restaurants

  scope :sorted, lambda { order("city_name ASC")}

end
