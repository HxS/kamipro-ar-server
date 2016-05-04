class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :company, index: true, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
