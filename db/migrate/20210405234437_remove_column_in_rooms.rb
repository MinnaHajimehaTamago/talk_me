class RemoveColumnInRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :title, :string
  end
end
