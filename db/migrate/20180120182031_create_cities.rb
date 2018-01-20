class CreateCities < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.string 'city_name', :limit => 25
      t.timestamps null: false
    end
    add_index('cities', 'city_name')
  end

  def down
    drop_table :cities
  end
end
