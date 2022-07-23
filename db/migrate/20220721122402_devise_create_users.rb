# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :nickname, null: false
      t.string :name, null: true
      t.string :image_url, null: false
      t.boolean :admin, null: false, default: false
      t.timestamps null: false
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
