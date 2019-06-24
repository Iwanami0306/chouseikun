class RemoveEventFromJoins < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :joins, :event
    remove_column :joins, :event_id, :integer
    remove_reference :joins, :event
    add_reference :joins, :event
  end
end
