class Restaurant < ActiveRecord::Base

    has_many :ratings
    has_many :users, through: :ratings

    scope :sorted, lambda { order("restaurant_name ASC")}

    validates :restaurant_name, :presence => true,
                                :length => { :maximum => 100 },
                                :uniqueness => true

    def self.search(search)
      where("neighborhood LIKE ? OR restaurant_name LIKE? OR city LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end

end
