class RemoveIntEventId < ActiveRecord::Migration[5.1]
  def change
    remove_column :event_dates,:event_id,:integer
    add_column :event_dates,:event_id,:string
  end
end
