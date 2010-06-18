class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.references :registry
      t.decimal :price
      t.references :store
      t.string :sku
      t.integer :quantity
      t.string :website
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
