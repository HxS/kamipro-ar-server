class Staff < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true
  validates :company_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  scope :with_company, -> (company_id) { where(company: company_id) }
end
