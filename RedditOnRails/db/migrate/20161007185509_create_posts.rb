class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :sub_id, null: false
      t.integer :author_id, null: false
      
      t.index :author_id
      t.index :sub_id
      t.index :title

      t.timestamps null: false
    end

  end
end
