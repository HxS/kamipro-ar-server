class AdvertisingImpression < ActiveRecord::Base
  belongs_to :advertising
  belongs_to :user
end
