class AddForeignKeyToCompany < ActiveRecord::Migration
  def change
    add_foreign_key :companies, :characters
  end
end
