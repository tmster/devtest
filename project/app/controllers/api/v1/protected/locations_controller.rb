module Api
  module V1
    module Protected
      class LocationsController < BaseController
        def index
          locations = Location.by_country_and_panel_provider(@country)

          render json: LocationSerializer.new(locations, { params: { authorized_area: true }}).serialized_json
        end
      end
    end
  end
end