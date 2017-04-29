class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  scope :sorted, lambda { order("date_rated DESC")}

end
