class CompaniesCharacter < ActiveRecord::Base
  belongs_to :company
  belongs_to :character
end
