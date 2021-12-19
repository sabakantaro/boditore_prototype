class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
