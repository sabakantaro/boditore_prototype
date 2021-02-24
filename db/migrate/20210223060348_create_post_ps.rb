class CreatePostPs < ActiveRecord::Migration[5.1]
  def change
    create_table :post_ps do |t|
      t.text :content

      t.timestamps
    end
  end
end
