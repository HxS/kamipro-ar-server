class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :asset_url

      t.timestamps null: false
    end
  end
end
