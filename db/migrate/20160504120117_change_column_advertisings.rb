class ChangeColumnAdvertisings < ActiveRecord::Migration
  def up
		add_column :advertisings, :company_id, :integer
		add_index :advertisings, :company_id
		add_foreign_key :advertisings, :companies
	end

	def down
		remove_column :advertisings, :company
		remove_index :advertisings, :company_id
		remove_foreign_key :advertisings, :companies
	end
end
