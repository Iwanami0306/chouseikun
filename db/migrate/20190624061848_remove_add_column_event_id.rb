class RemoveAddColumnEventId < ActiveRecord::Migration[5.1]
  def change
    remove_column :joins, :event_id, :string
    add_column :joins, :event_id, :integer
    add_foreign_key :joins, :event
  end
end
