class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :feeling
      t.references :event_date, foreign_key: true
      t.references :join, foreign_key: true

      t.timestamps
    end
  end
end
