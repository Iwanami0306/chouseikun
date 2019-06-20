class ChangeColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events,:id, :integer
    add_column :events,:id, :string
  end
end
