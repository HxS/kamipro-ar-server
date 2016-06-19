class AddNameToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :name, :string
    add_index :markers, :name, :unique => true
  end
end
