class Advertising < ActiveRecord::Base
	belongs_to :marker
	has_many :impressions
	has_many :reaches
end
