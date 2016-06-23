class Character < ActiveRecord::Base
  has_many :companies, :dependent => :destroy

  mount_uploader :thumbnail, CharacterThumbnailUploader

  validates :name, presence: true
  validates :thumbnail, presence: true
end
