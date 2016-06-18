class RenameColumnNameOfMarkers < ActiveRecord::Migration
  def change
    rename_column :markers, :image_url, :image
  end
end
