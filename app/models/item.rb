class Item < ActiveRecord::Base
  has_one :store
  belongs_to :registry
end
