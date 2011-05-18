class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :tags_id
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.string :fb_property
      t.string :fb_content

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
