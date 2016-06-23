class User < ActiveRecord::Base
  has_many :impressions, :dependent => :destroy
  has_many :reaches, :dependent => :destroy
  after_initialize :set_default_value

  private
  def set_default_value
    self.uuid = SecureRandom.uuid
  end
end
