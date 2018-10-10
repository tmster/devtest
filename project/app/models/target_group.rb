class TargetGroup < ApplicationRecord
  belongs_to :panel_provider
  has_many :countries_target_groups
  has_many :countries, through: :countries_target_groups

  has_many :children, class_name: "TargetGroup", foreign_key: :parent_id
  belongs_to :parent, optional: true, class_name: "TargetGroup", foreign_key: :parent_id

  validates :name, presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :secret_code, presence: true

  scope :by_country_and_panel_provider, (lambda do |country|
    joins(:countries_target_groups)
      .where(countries_target_groups: { country: country })
      .where(panel_provider: country.panel_provider)
  end)
end
