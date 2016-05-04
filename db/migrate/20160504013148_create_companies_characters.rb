class CreateCompaniesCharacters < ActiveRecord::Migration
  def change
    create_table :companies_characters do |t|
      t.references :company, index: true, foreign_key: true
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
