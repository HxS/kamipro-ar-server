class RenameColumnOfAdvertisings < ActiveRecord::Migration
  def change
    rename_column :advertisings, :image_url, :image
    rename_column :advertisings, :link_url, :link
  end
end
