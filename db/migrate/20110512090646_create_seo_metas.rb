class CreateSeoMetas < ActiveRecord::Migration
  def self.up
    create_table :seo_metas do |t|
      t.string :meta_description
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_url

      t.timestamps
    end
  end

  def self.down
    drop_table :seo_metas
  end
end
