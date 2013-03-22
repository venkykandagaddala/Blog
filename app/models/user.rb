class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :middlename
  validates :firstname, :presence =>true,
						:length => {:minimum => 5}
  validates :lastname, :presence =>true
					
end
