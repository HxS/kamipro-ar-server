class Impression < ActiveRecord::Base
  belongs_to :advertising
  belongs_to :user

  [:advertising_id, :user_id, :latitude, :longitude, :displayed_at].each{|sym|
    validates sym, presence: true, on: :create
  }
end
