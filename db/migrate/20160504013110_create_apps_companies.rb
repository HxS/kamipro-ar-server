class CreateAppsCompanies < ActiveRecord::Migration
  def change
    create_table :apps_companies do |t|
      t.references :app, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
