class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :url_identifier, null: false, index: { unique: true }
      t.string :location, null: false

      t.timestamps
    end
  end
end
