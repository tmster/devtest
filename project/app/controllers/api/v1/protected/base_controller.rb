module Api
  module V1
    module Protected
      class BaseController < Api::V1::BaseController
        before_action :authenticate

        private

        def authenticate
          authenticate_or_request_with_http_token do |token, options|
            ActiveSupport::SecurityUtils.secure_compare(token, Rails.application.credentials.auth_token)
          end
        end
      end
    end
  end
end