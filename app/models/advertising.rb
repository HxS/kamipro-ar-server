class Advertising < ActiveRecord::Base
  belongs_to :marker
  has_many :impressions, :dependent => :destroy
  has_many :reaches, :dependent => :destroy

  mount_uploader :image, AdvertisingImageUploader


  validates :link, presence: true
  validates :image, presence: true
  validates :marker_id, presence: true

  scope :with_marker, -> (marker_id) { where(marker: marker_id) }
end
