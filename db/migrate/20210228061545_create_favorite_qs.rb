class CreateFavoriteQs < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_qs do |t|
      t.references :user, null:false
      t.references :post_q, null:false

      t.timestamps
    end
  end
end
