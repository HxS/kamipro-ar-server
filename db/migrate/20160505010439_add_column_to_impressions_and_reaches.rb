class AddColumnToImpressionsAndReaches < ActiveRecord::Migration
  def change
		add_column :impressions, :displayed_at, :datetime
		add_column :reaches, :displayed_at, :datetime
  end
end
