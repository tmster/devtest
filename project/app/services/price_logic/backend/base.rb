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
        @web_content ||= open(url).read
      end
    end
  end
end