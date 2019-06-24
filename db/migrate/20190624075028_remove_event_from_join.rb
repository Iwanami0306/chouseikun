class RemoveEventFromJoin < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :joins, :events
    remove_reference :joins, :event, foreign_key: true
    remove_column :joins, :event_id
    add_reference :joins, :event, foreign_key: true
  end
end
