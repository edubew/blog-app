class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counters

      t.timestamps
    end
  end
end
