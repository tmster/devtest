TargetParamsSchema = Dry::Validation.Schema do
  required(:country_code).value(format?: /[A-Z]{2}/)
  required(:target_group_id).filled

  required(:locations).each do
    schema do
      required(:id).filled
      required(:panel_size).filled
    end
  end
end
