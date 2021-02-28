class CreateFavoritePs < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_ps do |t|
      t.references :user, null:false
      t.references :post_p, null:false

      t.timestamps
    end
  end
end
