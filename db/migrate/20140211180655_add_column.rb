class AddColumn < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :provider, :string
  end
end
