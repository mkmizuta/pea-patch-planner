class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :blogposts, :user_id, :integer
  end
end
