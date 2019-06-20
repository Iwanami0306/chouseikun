class CreateJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :joins do |t|
      t.text :name
      t.references :event, foreign_key: true

      t.timestamps
    end
    add_index :joins, [:event_id,:created_at]
  end
end
