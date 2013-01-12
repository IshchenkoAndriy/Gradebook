class Group < ActiveRecord::Base
  attr_accessible :name
  translates :name
end
