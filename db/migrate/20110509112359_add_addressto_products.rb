class AddAddresstoProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :address, :string
  end

  def self.down
    remove_column :address, :category  
  end
end
