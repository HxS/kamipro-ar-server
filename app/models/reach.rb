class Reach < ActiveRecord::Base
  belongs_to :marker
  belongs_to :character
  belongs_to :advertising
  belongs_to :user

	[:marker_id, :advertising_id, :character_id, :user_id, :latitude, :longitude, :displayed_at].each{|sym|
		validates sym, presence: true, on: :create
	}
end
