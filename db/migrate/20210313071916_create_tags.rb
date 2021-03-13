class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, uniqueness: true
      t.integer :officiality_id, null: false, default: 0
      t.timestamps
    end
  end
end
