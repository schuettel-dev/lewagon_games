class CreateBatchMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_memberships do |t|
      t.references :batch, null: false
      t.references :user, null: false
      t.string :role, null: false, default: "student"

      t.index [:batch_id, :user_id], unique: true

      t.timestamps
    end
  end
end
