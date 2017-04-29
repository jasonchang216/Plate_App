class CreateRatings < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.integer 'restaurant_rating'
      t.belongs_to :restaurant, index: true
      t.belongs_to :user, index: true
      t.text 'restaurant_comment'
      t.date 'date_rated'
      t.timestamps null: false
    end
    add_index('ratings', 'restaurant_rating')
  end

  def down
    drop_table :ratings
  end
end
