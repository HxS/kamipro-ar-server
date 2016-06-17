class Company < ActiveRecord::Base
	has_many :apps_companies
	has_many :apps, :through => :apps_companies
	has_many :markers
	has_many :staffs
	belongs_to :character
end
