class CreateUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :id, unique: true
  end
end
