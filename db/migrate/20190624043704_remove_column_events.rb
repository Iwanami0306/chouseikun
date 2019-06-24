class RemoveColumnEvents < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :joins, :events
    
  end
end
