class PanelProvider < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  def price
    price_logic_finder&.backend_strategy&.call
  end

  private

  def price_logic_finder
    @price_logic_finder ||= PriceLogic::Finder.new(self)
  end
end
