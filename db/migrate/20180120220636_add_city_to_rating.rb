class AddCityToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :city, index: true, foreign_key: true
  end
end
