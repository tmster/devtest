class ApplicationController < ActionController::Base
  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(token, Rails.application.credentials.auth_token)
    end
  end
end
