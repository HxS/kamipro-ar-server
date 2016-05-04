class Impression < ActiveRecord::Base
  belongs_to :marker
  belongs_to :character
  belongs_to :advertising
  belongs_to :user
end
