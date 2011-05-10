class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :title
      t.string :place_key
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
