class DeleteColumnToAdvertisings < ActiveRecord::Migration
  def change
    remove_reference :advertisings, :company, index:true, foreign_key:true
  end
end
