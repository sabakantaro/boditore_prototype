class CreatePostQs < ActiveRecord::Migration[5.1]
  def change
    create_table :post_qs do |t|
      t.text :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
