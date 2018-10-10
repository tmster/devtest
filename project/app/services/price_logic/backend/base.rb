# frozen_string_literal: true

require 'open-uri'

module PriceLogic
  module Backend
    class Base
      attr_reader :record

      def initialize(record)
        @record = record
      end

      def applicable?
        record.code == name
      end

      private

      def web_content
        @web_content ||= Scraper.new(url).content
      end
    end
  end
end
