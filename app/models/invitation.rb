class Invitation < ActiveRecord::Base
  belongs_to :invited_user, :class => "User", :foreign_key => "invited_user_id"
  belongs_to :inviting_user, :class => "User", :foreign_key => "inviting_user_id"
  belongs_to :event
end
