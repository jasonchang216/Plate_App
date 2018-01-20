class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant
  belongs_to :city

  scope :sorted, lambda { order("date_rated DESC")}

end
