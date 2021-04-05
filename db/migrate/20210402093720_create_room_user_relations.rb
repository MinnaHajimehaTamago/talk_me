class CreateRoomUserRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :room_user_relations do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
