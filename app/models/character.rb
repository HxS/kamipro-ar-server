class Character < ActiveRecord::Base
  has_many :companies

  mount_uploader :thumbnail, CharacterThumbnailUploader
end
