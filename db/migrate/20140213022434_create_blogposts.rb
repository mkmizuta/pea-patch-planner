class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :title
      t.text :post_text
      t.string :pic_upload

      t.timestamps
    end
  end
end
