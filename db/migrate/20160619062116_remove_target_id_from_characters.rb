class RemoveTargetIdFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :target_id
  end
end
