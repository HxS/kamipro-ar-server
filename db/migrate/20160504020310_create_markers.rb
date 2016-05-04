class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.references :company, index: true, foreign_key: true
      t.string :image_url

      t.timestamps null: false
    end
  end
end
