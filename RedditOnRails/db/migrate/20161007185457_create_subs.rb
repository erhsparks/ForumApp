class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :moderator_id, null: false

      t.index :title, unique: true
      t.index :moderator_id

      t.timestamps null: false
    end
  end
end
