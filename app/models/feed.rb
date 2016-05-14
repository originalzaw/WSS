class Feed < ActiveRecord::Base
	has_many :feedComments
end
