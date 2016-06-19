class RenameColumnNameOfCharacters < ActiveRecord::Migration
  def change
    rename_column :characters, :thumbnail_url, :thumbnail
  end
end
