class AddVersionToApps < ActiveRecord::Migration
  def change
    add_column :apps, :android_version, :string
    add_column :apps, :ios_version, :string
  end
end
