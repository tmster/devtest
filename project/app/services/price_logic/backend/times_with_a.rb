module PriceLogic
  module Backend
    class TimesWithA < Base
      def name
        "times_a"
      end

      def call
        calculate_letters / 100
      end

      private

      def url
        "http://time.com/"
      end

      def calculate_letters
        web_content.count("a")
      end
    end
  end
end