module Api
  module V1
    class LocationsController < BaseController
      def index
        locations = Location.by_country_and_panel_provider(@country)

        render json: LocationSerializer.new(locations).serialized_json
      end

      private

      def find_location
        @location = Location.find
      end
    end
  end
end