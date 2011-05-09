class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.text :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
