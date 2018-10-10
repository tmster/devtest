# frozen_string_literal: true

module Api
  module V1
    module Protected
      class TargetGroupsController < BaseController
        def index
          target_groups = TargetGroup.by_country_and_panel_provider(@country)

          render json: TargetGroupSerializer.new(target_groups, params: { authorized_area: true }).serialized_json
        end

        def evaluate
          return if params_validation_failed?

          render json: { price: @country.panel_provider.price }
        end

        private

        def params_validation_failed?
          # FIXME: Convert params to unsafe hash to avoid Type mismatch in dry validation
          validation_result = TargetParamsSchema.call(params.to_unsafe_hash)
          return if validation_result.success?

          render json: validation_result.errors.to_json, status: :unprocessable_entity
        end
      end
    end
  end
end
