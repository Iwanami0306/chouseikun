class RemoveEventFromEventDates < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :event_dates, :events
    remove_column :event_dates, :event_id
    remove_reference :event_dates, :event, foreign_key: true
    add_reference :event_dates, :event, foreign_key: true
  end
end
