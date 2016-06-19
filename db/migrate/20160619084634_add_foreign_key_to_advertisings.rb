class AddForeignKeyToAdvertisings < ActiveRecord::Migration
  def change
    remove_index :advertisings, :marker_id
    add_foreign_key :advertisings, :markers
  end
end
