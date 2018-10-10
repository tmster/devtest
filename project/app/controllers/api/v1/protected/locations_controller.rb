module Api
  module V1
    module Protected
      class LocationsController < BaseController
        def index
          render json: {}
        end
      end
    end
  end
end