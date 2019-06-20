class CreateEventDates < ActiveRecord::Migration[5.1]
  def change
    create_table :event_dates do |t|
      t.text :time
      t.references :event, foreign_key: true

      t.timestamps
    end
    add_index :event_dates, [:event_id,:created_id]
  end
end
