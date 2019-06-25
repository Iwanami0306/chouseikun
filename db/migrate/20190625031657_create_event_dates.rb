class CreateEventDates < ActiveRecord::Migration[5.1]
  def change
    create_table :event_dates do |t|
      t.text :choice
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
