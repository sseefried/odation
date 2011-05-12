class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.string :title
      t.string :description
      t.integer :seo_meta

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
