class Restaurant < ActiveRecord::Base

    has_many :ratings
    has_many :users, through: :ratings

    scope :sorted, lambda { order("restaurant_name ASC")}

end
