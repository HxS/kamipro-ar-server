class Marker < ActiveRecord::Base
  belongs_to :company
	has_many :marker
end
