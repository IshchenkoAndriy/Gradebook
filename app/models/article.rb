class Article < ActiveRecord::Base
  attr_accessible :text, :title, :user_id
  
  belongs_to :user
  
  validates :text, :title, :user, :presence => true
end
