module PriceLogic
  module Backend
    class TimesNodes < Base
      def name
        "times_html"
      end

      def call
        html_nodes.search('*').count
      end

      private

      def url
        "http://time.com/"
      end

      def html_nodes
        @html_nodes ||= Nokogiri::HTML(web_content) do |config|
          config.strict.noblanks
        end
      end
    end
  end
end
