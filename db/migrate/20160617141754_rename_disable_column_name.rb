class RenameDisableColumnName < ActiveRecord::Migration
  def change
		rename_column :companies, :disabled, :enabled
  end
end
