# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      before_action :set_default_response_format
      before_action :set_country

      private

      def set_default_response_format
        request.format = :json
      end

      def set_country
        @country = Country.find_by!(code: params[:country_code])
      end
    end
  end
end
