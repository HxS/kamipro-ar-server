class AddAppIdToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :app_id, :integer
    add_foreign_key :impressions, :apps
  end
end
