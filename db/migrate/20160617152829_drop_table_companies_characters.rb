class DropTableCompaniesCharacters < ActiveRecord::Migration
  def change
    drop_table :companies_characters
  end
end
