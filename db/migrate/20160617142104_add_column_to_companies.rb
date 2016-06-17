class AddColumnToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :character_id, :integer
		add_index :companies, :character_id
  end
end
