class CreateCharacterImpressions < ActiveRecord::Migration
  def change
    create_table :character_impressions do |t|
      t.references :character, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.timestamps :displayed_at

      t.timestamps null: false
    end
  end
end
