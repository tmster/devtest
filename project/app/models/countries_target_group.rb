class CountriesTargetGroup < ApplicationRecord
  belongs_to :country
  belongs_to :target_group, -> { where parend_id: nil }
end
