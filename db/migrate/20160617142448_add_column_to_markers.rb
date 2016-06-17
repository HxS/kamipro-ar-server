class AddColumnToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :enabled, :boolean
    add_column :markers, :target_id, :string
  end
end
