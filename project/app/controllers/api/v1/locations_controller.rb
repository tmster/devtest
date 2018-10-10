module Api
  module V1
    class LocationsController < BaseController
      def index
        render json: {}
      end

      private

      def find_location
        @location = Location.find
      end
    end
  end
end