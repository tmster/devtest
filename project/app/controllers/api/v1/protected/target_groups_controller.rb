module Api
  module V1
    module Protected
      class TargetGroupsController < BaseController
        def index
          render json: {}
        end

        def evaluate
          return if validate_params

          render json: {}
        end

        private

        def validate_params
          # FIXME Convert params to unsafe hash to avoid Type missmatch in dry validation
          validation_result = TargetParamsSchema.call(params.to_unsafe_hash)
          return if validation_result.success?

          render json: validation_result.errors.to_json, status: :unprocessable_entity
        end
      end
    end
  end
end