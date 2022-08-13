# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :github_id, null: false
      t.string :nickname, null: false
      t.string :name, null: true
      t.string :image_url, null: false
      t.string :privilege, null: false, default: "user"
      t.timestamps null: false
    end

    add_index :users, [:github_id], unique: true
  end
end
