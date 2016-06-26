class Advertising < ActiveRecord::Base
  belongs_to :marker
  has_many :impressions, :dependent => :destroy
  has_many :reaches, :dependent => :destroy

  mount_uploader :image, AdvertisingImageUploader


  validates :link, presence: true
  validates :image, presence: true
  validates :marker_id, presence: true

  scope :with_marker, -> (marker_id) { where(marker: marker_id) }
  scope :with_company, -> (company_id) { joins(marker: :company).merge(Company.where(id: company_id)) }

  def impressions_count
    impressions.count
  end

  def reaches_count
    reaches.count
  end
end
