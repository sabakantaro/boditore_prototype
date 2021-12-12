# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :string
    add_column :users, :experience, :integer
  end
end
