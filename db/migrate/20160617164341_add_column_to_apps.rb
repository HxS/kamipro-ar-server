class AddColumnToApps < ActiveRecord::Migration
  def change
    add_column :apps, :memo, :string
  end
end
