class User < ActiveRecord::Base
	has_many :impressions
	has_many :reaches
	after_initialize :set_default_value

  private
  def set_default_value
    self.uuid = SecureRandom.uuid
  end
end
