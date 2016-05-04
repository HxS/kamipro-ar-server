class AppsCompany < ActiveRecord::Base
  belongs_to :app
  belongs_to :company
end
