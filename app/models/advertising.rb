class Advertising < ActiveRecord::Base
	belongs_to :company
	has_many :impressions
	has_many :reaches
end
