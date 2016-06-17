class DeleteColumnToImpressions < ActiveRecord::Migration
  def change
		remove_reference :impressions, :marker, index:true, foreign_key:true
		remove_reference :impressions, :character, index:true, foreign_key:true
  end
end
