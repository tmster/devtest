# frozen_string_literal: true

class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :external_id

  attribute :secret_code, if: proc { |_record, params|
    params && params[:authorized_area] == true
  }
end
