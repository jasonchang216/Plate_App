class UpdateRestaurantTable < ActiveRecord::Migration
  def up
    add_column('restaurants', 'city', :string, :limit => 30)
    add_column('restaurants', 'neighborhood', :string, :limit => 100)
  end

  def down
    remove_column('restaurants', 'city')
    remove_column('restaurants', 'neighborhood')
  end
end
