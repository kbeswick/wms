class AddQtyBoughtToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :qtybought, :integer
  end

  def self.down
    remove_column :items, :qtybought
  end
end
