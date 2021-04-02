class RemoveColumnsToSigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :signs, :position_id, :integer
    remove_column :signs, :characteristic_id, :integer
    remove_column :signs, :content_id, :integer
  end
end
