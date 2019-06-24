class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :memo
      t.text :time
      t.string :uuid
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :events, [:user_id,:created_at]
  end
end
