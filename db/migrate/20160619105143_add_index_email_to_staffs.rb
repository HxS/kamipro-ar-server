class AddIndexEmailToStaffs < ActiveRecord::Migration
  def change
    add_index :staffs, :email, :unique => true
  end
end
