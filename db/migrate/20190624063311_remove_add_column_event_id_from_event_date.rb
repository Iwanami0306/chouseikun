class RemoveAddColumnEventIdFromEventDate < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :event_dates, :event 
    remove_column :event_dates, :event_id, :string
    add_column :event_dates, :event_id, :integer
    add_foreign_key :event_dates, :event    
  end
end
