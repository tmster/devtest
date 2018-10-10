# frozen_string_literal: true

class PanelProvider < ApplicationRecord
  has_many :location_groups

  validates :code, presence: true, uniqueness: true

  def price
    price_logic_finder&.backend_strategy&.call
  end

  private

  def price_logic_finder
    @price_logic_finder ||= PriceLogic::Finder.new(self)
  end
end
