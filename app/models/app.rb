class App < ActiveRecord::Base
	has_many :apps_companies
	has_many :companies, :through => :apps_companies
end
