class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.string 'restaurant_name', :limit => 25
      t.timestamps null: false
    end
    add_index('restaurants', 'restaurant_name')
  end

  def down
    drop_table :restaurants
  end
end
