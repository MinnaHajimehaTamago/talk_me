class TableDrops < ActiveRecord::Migration[6.0]
  def change
    drop_table :personal_informations
    drop_table :favorites
    drop_table :spots
    drop_table :appearances
  end
end
