class CreateAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :appearances do |t|
      t.integer    :hair_id,        null: false
      t.integer    :eye_shape_id,   null: false
      t.integer    :eye_size_id,    null: false
      t.integer    :nose_shape_id,  null: false
      t.integer    :nose_size_id,   null: false
      t.integer    :mouth_shape_id, null: false
      t.integer    :mouth_size_id,  null: false
      t.integer    :height_id,      null: false
      t.integer    :body_shape_id,  null: false
      t.integer    :gender_id,      null: false
      t.string     :image,          null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
