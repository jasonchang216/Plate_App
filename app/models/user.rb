class User < ActiveRecord::Base

  has_secure_password

  has_many :ratings
  has_many :restaurants, through: :ratings

  scope :sorted, lambda { order("username ASC")}

  def name
    "#{first_name} #{last_name}"
  end

end
