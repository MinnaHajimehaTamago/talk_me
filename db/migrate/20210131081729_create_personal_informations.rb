class CreatePersonalInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_informations do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.date   :birth_date,         null: false
      t.references :user
      t.timestamps
    end
  end
end
