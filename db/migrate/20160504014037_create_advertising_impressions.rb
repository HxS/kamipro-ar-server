class CreateAdvertisingImpressions < ActiveRecord::Migration
  def change
    create_table :advertising_impressions do |t|
      t.references :advertising, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.timestamps :displayed_at

      t.timestamps null: false
    end
  end
end
