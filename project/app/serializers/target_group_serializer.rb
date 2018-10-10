class TargetGroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :external_id

  attribute :secret_code, if: Proc.new { |record, params|
    params && params[:authorized_area] == true
  }

  attribute :panel_provider_code do |record|
    record.panel_provider.code
  end

  attribute :children do |record, params|
    TargetGroupSerializer.new(record.children, { params: params }).serializable_hash
  end
end
