class Advertising < ActiveRecord::Base
  belongs_to :marker
  has_many :impressions, :dependent => :destroy
  has_many :reaches, :dependent => :destroy

  mount_uploader :image, AdvertisingImageUploader
end
