class CreateCharactersAdvertisings < ActiveRecord::Migration
  def change
    create_table :characters_advertisings do |t|
      t.references :character, index: true, foreign_key: true
      t.references :advertising, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
