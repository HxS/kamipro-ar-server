class AddAppIdToReaches < ActiveRecord::Migration
  def change
    add_column :reaches, :app_id, :integer
    add_foreign_key :reaches, :apps
  end
end
