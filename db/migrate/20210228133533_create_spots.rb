class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.integer    :state_id,     null: false
      t.string     :city,         null: false
      t.integer    :spot_type_id, null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
