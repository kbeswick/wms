class User < ActiveRecord::Base
  acts_as_authentic
  has_many :addresses

  accepts_nested_attributes_for :addresses, :allow_destroy => :false,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :email,
            :message => "Must be a vaild email address.",
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } 

  validates_uniqueness_of :login
  validates_presence_of :first_name
  validates_presence_of :last_name
end
