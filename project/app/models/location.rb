class Location < ApplicationRecord
  belongs_to :location_group
  validates :name, presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :secret_code, presence: true

  scope :by_country_and_panel_provider, (lambda do |country|
    joins(:location_group)
      .where(location_groups: { country: country })
      .where(location_groups: { panel_provider: country.panel_provider })
  end)
end
