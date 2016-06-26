class AddMaxToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :max_marker, :integer, null: false, default: 1
    add_column :companies, :max_advertise, :integer, null: false, default: 5
  end
end
