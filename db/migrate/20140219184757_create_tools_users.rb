class CreateToolsUsers < ActiveRecord::Migration
  def change
    create_table :tools_users do |t|
      t.belongs_to :tool
      t.belongs_to :user
      t.datetime :checkout
      t.datetime :checkin
    end
  end
end
