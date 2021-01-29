class CreateSigns < ActiveRecord::Migration[6.0]
  def change
    create_table :signs do |t|
      t.string     :first_name,        null: false
      t.string     :last_name,         null: false
      t.string     :first_name_kana,   null: false
      t.string     :last_name_kana,    null: false
      t.integer    :state_id,          null: false
      t.string     :city,              null: false
      t.integer    :spot_type_id,      null: false
      t.integer    :position_id,       null: false
      t.integer    :characteristic_id, null: false
      t.integer    :content_id,        null: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
