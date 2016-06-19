class App < ActiveRecord::Base
  has_many :apps_companies, :dependent => :destroy
  has_many :companies, :through => :apps_companies
end
