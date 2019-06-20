class RemoveTimeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :time, :text
  end
end
