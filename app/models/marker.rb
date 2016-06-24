class Marker < ActiveRecord::Base
  belongs_to :company
  has_many :advertisings, :dependent => :destroy

  mount_uploader :image, MarkerImageUploader
  before_destroy :validate_updated_at
  after_destroy :delete_from_vuforia


  validates :name, presence: true
  validates :company_id, presence: true
  validates :image, presence: true

  validate :validate_updated_at, on: :update

  scope :with_company, -> (company_id) { where(company: company_id) }

  def impressions_count
    Impression.joins(advertising: :marker).merge(Marker.where(id: id)).count
  end

  def reaches_count
    Reach.joins(advertising: :marker).merge(Marker.where(id: id)).count
  end

  def delete_from_vuforia
    Vuforia.delete target_id
  end

private
  def validate_updated_at
    if updated_at + 120 > Time.now
      errors.add(" ", "連続して変更することはできません。約120秒待って再度実行してください")
      return false
    end
  end
end
