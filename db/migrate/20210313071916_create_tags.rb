class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :officiality_id, null: false
      t.timestamps
    end
  end
end
