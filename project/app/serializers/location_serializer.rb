class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :external_id

  attribute :secret_code, if: Proc.new { |record, params|
    params && params[:authorized_area] == true
  }
end
