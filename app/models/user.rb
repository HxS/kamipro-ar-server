class User < ActiveRecord::Base
	after_initialize :set_default_value

  private
  def set_default_value
    self.uuid = SecureRandom.uuid
  end
end
