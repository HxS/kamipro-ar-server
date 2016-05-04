class Character < ActiveRecord::Base
	has_many :characters_advertisings
	has_many :advertisings, :through => :characters_advertisings
end
