class AddCityToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :city, index: true, foreign_key: true
  end
end
