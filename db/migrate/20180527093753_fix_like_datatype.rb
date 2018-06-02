class FixLikeDatatype < ActiveRecord::Migration[5.1]
  def change
    change_column :likes, :user_id, 'integer USING user_id::integer'
    change_column :likes, :restaurant_id, 'integer USING restaurant_id::integer'
  end
end
