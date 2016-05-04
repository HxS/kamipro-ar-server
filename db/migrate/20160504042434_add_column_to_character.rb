class AddColumnToCharacter < ActiveRecord::Migration
  def change
		add_column :characters, :name, :string
		add_column :characters, :thumbnail_url, :string
  end
end
