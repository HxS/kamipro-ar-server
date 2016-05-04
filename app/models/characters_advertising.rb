class CharactersAdvertising < ActiveRecord::Base
  belongs_to :character
  belongs_to :advertising
end
