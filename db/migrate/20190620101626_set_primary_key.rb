class SetPrimaryKey < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :id, :string
    add_column :events, :id, :string, primary_key: true
  end
end
