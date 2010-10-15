class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :title
      t.string :street
      t.string :street_two
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
