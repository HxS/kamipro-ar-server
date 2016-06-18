class Marker < ActiveRecord::Base
  belongs_to :company
  has_many :marker
  has_many :advertisings

  mount_uploader :image, MarkerImageUploader
end
