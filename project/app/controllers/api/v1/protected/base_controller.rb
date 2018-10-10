# frozen_string_literal: true

module Api
  module V1
    module Protected
      class BaseController < Api::V1::BaseController
        before_action :authenticate

        private

        def authenticate_token
          authenticate_or_request_with_http_token do |token, _options|
            ActiveSupport::SecurityUtils.secure_compare(token, Rails.application.credentials.auth_token)
          end
        end

        def render_unauthorized
          render json: { errors: ['Invalid token'] }, status: :unauthorized
        end

        def authenticate
          authenticate_token || render_unauthorized
        end
      end
    end
  end
end
