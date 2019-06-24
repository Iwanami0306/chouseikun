class RemoveEventFromEventDate < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :jevent_dates, :event
    remove_column :event_dates, :event_id, :integer
    remove_reference :event_dates, :event
    add_reference :event_dates, :event
  end
end
