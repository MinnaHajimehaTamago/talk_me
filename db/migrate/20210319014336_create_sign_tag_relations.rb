class CreateSignTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :sign_tag_relations do |t|
      t.references :sign, foreign_key: true
      t.references :tag,  foreign_key: true
      t.timestamps
    end
  end
end
