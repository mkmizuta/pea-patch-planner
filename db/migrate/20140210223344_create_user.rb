class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :email
      t.boolean :admin
    end
  end
end
