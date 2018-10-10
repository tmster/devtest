module Api
  module V1
    class TargetGroupsController < BaseController
      def index
        target_groups = TargetGroup.by_country_and_panel_provider(@country)

        render json: TargetGroupSerializer.new(target_groups).serialized_json
      end
    end
  end
end