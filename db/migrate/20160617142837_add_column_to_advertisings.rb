class AddColumnToAdvertisings < ActiveRecord::Migration
  def change
    add_column :advertisings, :marker_id, :integer
		add_index :advertisings, :marker_id
    add_column :advertisings, :enabled, :boolean
  end
end
