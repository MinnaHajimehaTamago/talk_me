class RemoveColumnsInSigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :signs, :first_name, :string
    remove_column :signs, :last_name, :string
    remove_column :signs, :first_name_kana, :string
    remove_column :signs, :last_name_kana, :string
    remove_column :signs, :state_id, :integer
    remove_column :signs, :city, :string
    remove_column :signs, :spot_type_id, :integer
  end
end
