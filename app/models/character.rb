class Character < ActiveRecord::Base
	has_many :impressions
	has_many :reaches
end
