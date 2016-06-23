class Marker < ActiveRecord::Base
  belongs_to :company
  has_many :advertisings, :dependent => :destroy

  mount_uploader :image, MarkerImageUploader
  after_destroy :delete_from_vuforia


  validates :name, presence: true
  validates :company_id, presence: true
  validates :image, presence: true

  scope :with_company, -> (company_id) { where(company: company_id) }

  def delete_from_vuforia
    Vuforia.delete target_id
  end
end
