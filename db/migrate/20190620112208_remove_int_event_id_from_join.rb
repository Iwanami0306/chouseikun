class RemoveIntEventIdFromJoin < ActiveRecord::Migration[5.1]
  def change
    remove_column :joins, :event_id, :int
    add_column :joins, :event_id, :string
  end
end
