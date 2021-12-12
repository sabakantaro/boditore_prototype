# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end
  end
end
