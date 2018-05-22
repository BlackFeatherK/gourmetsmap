class AddFavorCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :favor_count, :integer, default: 0
  end
end
