class Advertising < ActiveRecord::Base
	belongs_to :company
	has_many :advertising_impressions
end
