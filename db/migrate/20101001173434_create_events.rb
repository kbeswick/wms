class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|

      t.string       :name,           :null => false
      t.string       :location,       :null => false                #must change to handle addresses eventually
      t.string       :description
      t.datetime     :start_time,     :null => false
      t.datetime     :end_time
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
