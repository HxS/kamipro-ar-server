class Company < ActiveRecord::Base
	has_many :markers
	has_many :staffs
	has_many :companies_characters
	has_many :characters, :through => :companies_characters
end
