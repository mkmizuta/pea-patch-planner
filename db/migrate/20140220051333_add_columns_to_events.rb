class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :location, :string
  end
end
