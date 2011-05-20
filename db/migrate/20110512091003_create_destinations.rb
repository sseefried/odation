class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.string :title
      t.string :description
      t.integer :cityid
      t.integer :countryid
      t.integer :regionid
      t.integer :longitude
      t.integer :latitude
      t.string  :timezone
      t.integer :dmaid
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
