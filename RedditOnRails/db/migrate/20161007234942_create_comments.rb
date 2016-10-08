class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false
      t.integer :parent_comment_id

      t.index   :author_id
      t.index   :post_id
      t.index   :parent_comment_id

      t.timestamps null: false
    end
  end
end
