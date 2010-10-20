class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      
      t.int                 :invited_user_id
      t.references          :event
      t.boolean             :rsvp,       :default => false
      t.timestamp           :rsvp_date
      t.int                 :inviting_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
