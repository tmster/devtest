# frozen_string_literal: true

module PriceLogic
  class Scraper
    attr_reader :uri

    def initialize(url)
      @uri = URI.parse(url)
    end

    def content
      web_page
    end

    private

    def web_page
      @web_page ||= Net::HTTP.get(uri)
    end
  end
end
