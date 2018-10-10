module Api
  module V1
    class BaseController < ApplicationController
      before_action :set_default_response_format

      private

      def set_default_response_format
        request.format = :json
      end
    end
  end
end