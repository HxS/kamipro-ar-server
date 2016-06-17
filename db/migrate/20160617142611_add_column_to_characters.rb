class AddColumnToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :target_id, :string
  end
end
