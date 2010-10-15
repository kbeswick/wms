class User < ActiveRecord::Base
  acts_as_authentic
  has_many :addresses

  accepts_nested_attributes_for :addresses, :allow_destroy => :false,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
