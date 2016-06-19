class Marker < ActiveRecord::Base
  belongs_to :company
  has_many :marker
  has_many :advertisings

  mount_uploader :image, MarkerImageUploader


  validates :name, presence: true
  validates :company_id, presence: true
  validates :image, presence: true
end
