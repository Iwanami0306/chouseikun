class AddMemoToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :memo, :text
  end
end
