class DropTableCharactersAdvertisings < ActiveRecord::Migration
  def change
    drop_table :characters_advertisings
  end
end
