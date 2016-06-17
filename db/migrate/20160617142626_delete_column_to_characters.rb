class DeleteColumnToCharacters < ActiveRecord::Migration
  def change
		remove_column :characters, :asset_url
  end
end
