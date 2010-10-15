class Address < ActiveRecord::Base
  belongs_to :user
  validates_format_of :phone_number,
          :message => "Must be a valid telephone number.",
          :with => /^[\(\)0-9\- \+\.]{10,20}$/ 
end
