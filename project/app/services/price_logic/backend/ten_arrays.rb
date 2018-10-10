# frozen_string_literal: true

module PriceLogic
  module Backend
    class TenArrays < Base
      def name
        '10_arrays'
      end

      def call
        sumarize_arrays
      end

      private

      def url
        'http://openlibrary.org/search.json?q=the+lord+of+the+rings'
      end

      def json
        @json ||= JSON.parse(web_content)
      end

      def sumarize_arrays
        json.values.last.inject(0) do |sum, item|
          sum + partial_sum(item)
        end
      end

      def partial_sum(item)
        item.values.select { |v| v.is_a?(Array) }.map(&:count).select { |v| v > 10 }.count
      end
    end
  end
end
