# frozen_string_literal: true

class AddColumnsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
  end
end
