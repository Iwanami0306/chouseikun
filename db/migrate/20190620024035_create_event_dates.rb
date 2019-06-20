class CreateEventDates < ActiveRecord::Migration[5.1]
  def change
    create_table :event_dates do |t|
      t.text :choice
      t.references :event, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
