class DeleteColumnToReaches < ActiveRecord::Migration
  def change
    remove_reference :reaches, :marker, index:true, foreign_key:true
    remove_reference :reaches, :character, index:true, foreign_key:true
  end
end
