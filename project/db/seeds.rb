def create_target_group(attrs)
  parent_target_group = TargetGroup.create!(
    name: attrs.fetch(:name),
    external_id: SecureRandom.uuid,
    parent: attrs[:parent],
    secret_code: SecureRandom.hex(64),
    panel_provider: PanelProvider.find_by!(code: attrs.fetch(:panel_provider_code))
  )

  if attrs[:country_code].present?
    CountriesTargetGroup.create!(
      target_group: parent_target_group,
      country: Country.find_by!(code: attrs.fetch(:country_code))
    )
  end

  attrs[:children].each do |child_attrs|
    create_target_group(child_attrs.merge(parent: parent_target_group))
  end
end

PANEL_PROVIDERS_CODES = %w[times_a 10_arrays times_html].freeze

COUNTRIES = [
  { code: "PL", panel_provider_code: "times_a" },
  { code: "US", panel_provider_code: "10_arrays" },
  { code: "UK", panel_provider_code: "times_html" }
].freeze

LOCATIONS = [
  { name: "New York", location_group_name: "Alpha" },
  { name: "Los Angeles", location_group_name: "Bravo" },
  { name: "Chicago", location_group_name: "Charlie" },
  { name: "Houston", location_group_name: "Delta" },
  { name: "Philadelphia", location_group_name: "Alpha" },
  { name: "Phoenix", location_group_name: "Bravo" },
  { name: "San Antonio", location_group_name: "Charlie" },
  { name: "San Diego", location_group_name: "Delta" },
  { name: "Dallas", location_group_name: "Alpha" },
  { name: "San Jose", location_group_name: "Bravo" },
  { name: "Austin", location_group_name: "Charlie" },
  { name: "Jacksonville", location_group_name: "Delta" },
  { name: "San Francisco", location_group_name: "Alpha" },
  { name: "Indianapolis", location_group_name: "Bravo" },
  { name: "Columbus", location_group_name: "Charlie" },
  { name: "Fort Worth", location_group_name: "Delta" },
  { name: "Charlotte", location_group_name: "Alpha" },
  { name: "Detroit", location_group_name: "Bravo" },
  { name: "El Paso", location_group_name: "Charlie" },
  { name: "Seattle", location_group_name: "Delta" }
].freeze


LOCATION_GROUPS = [
  { name: "Alpha", country_code: "PL", panel_provider_code: "times_a" },
  { name: "Bravo", country_code: "US", panel_provider_code: "10_arrays" },
  { name: "Charlie", country_code: "UK", panel_provider_code: "times_html" },
  { name: "Delta", country_code: "PL", panel_provider_code: "times_a" }
].freeze

TARGET_GROUPS = [
  {
    name: "Target Group Alpha",
    panel_provider_code: "times_a",
    country_code: "PL",
    children: [
      {
        name: "Target Group Alpha 1",
        panel_provider_code: "times_a",
        children: [
          {
            name: "Target Group Alpha 1 | 1",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Alpha 1 | 1 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
          {
            name: "Target Group Alpha 1 | 2",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Alpha 1 | 2 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
        ]
      },
      {
        name: "Target Group Alpha 2",
        panel_provider_code: "times_html",
        children: [
          {
            name: "Target Group Alpha 2 | 1",
            panel_provider_code: "times_html",
            children: [
              {
                name: "Target Group Alpha 2 | 1 | 1",
                panel_provider_code: "times_html",
                children: []
              },
            ]
          },
          {
            name: "Target Group Alpha 2 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Alpha 2 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      }
    ]
  },
  {
    name: "Target Group Bravo",
    panel_provider_code: "10_arrays",
    country_code: "US",
    children: [
      {
        name: "Target Group Bravo 1",
        panel_provider_code: "10_arrays",
        children: [
          {
            name: "Target Group Bravo 1 | 1",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Bravo 1 | 1 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
          {
            name: "Target Group Bravo 1 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Bravo 1 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      },
      {
        name: "Target Group Bravo 2",
        panel_provider_code: "10_arrays",
        children: [
          {
            name: "Target Group Bravo 2 | 1",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Bravo 2 | 1 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
          {
            name: "Target Group Bravo 2 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Bravo 2 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      }
    ]
  },
  {
    name: "Target Group Charlie",
    country_code: "PL",
    panel_provider_code: "times_html",
    children: [
      {
        name: "Target Group Charlie 1",
        panel_provider_code: "times_html",
        children: [
          {
            name: "Target Group Charlie 1 | 1",
            panel_provider_code: "times_html",
            children: [
              {
                name: "Target Group Charlie 1 | 1 | 1",
                panel_provider_code: "times_html",
                children: []
              },
            ]
          },
          {
            name: "Target Group Charlie 1 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Charlie 1 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      },
      {
        name: "Target Group Charlie 2",
        panel_provider_code: "10_arrays",
        children: [
          {
            name: "Target Group Charlie 2 | 1",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Charlie 2 | 1 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
          {
            name: "Target Group Charlie 2 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Charlie 2 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      }
    ]
  },
  {
    name: "Target Group Delta",
    panel_provider_code: "10_arrays",
    country_code: "PL",
    children: [
      {
        name: "Target Group Delta 1",
        panel_provider_code: "10_arrays",
        children: [
          {
            name: "Target Group Delta 1 | 1",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Delta 1 | 1 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
          {
            name: "Target Group Delta 1 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Delta 1 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      },
      {
        name: "Target Group Delta 2",
        panel_provider_code: "10_arrays",
        children: [
          {
            name: "Target Group Delta 2 | 1",
            panel_provider_code: "10_arrays",
            children: [
              {
                name: "Target Group Delta 2 | 1 | 1",
                panel_provider_code: "10_arrays",
                children: []
              },
            ]
          },
          {
            name: "Target Group Delta 2 | 2",
            panel_provider_code: "times_a",
            children: [
              {
                name: "Target Group Delta 2 | 2 | 1",
                panel_provider_code: "times_a",
                children: []
              },
            ]
          },
        ]
      }
    ]
  }
]

PANEL_PROVIDERS_CODES.each { |panel_provider_code| PanelProvider.create!(code: panel_provider_code) }

COUNTRIES.each do |country|
  Country.create!(
    code: country.fetch(:code),
    panel_provider: PanelProvider.find_by!(code: country.fetch(:panel_provider_code))
  )
end

LOCATION_GROUPS.each do |location_group|
  LocationGroup.create!(
    name: location_group.fetch(:name),
    country: Country.find_by!(code: location_group.fetch(:country_code)),
    panel_provider: PanelProvider.find_by!(code: location_group.fetch(:panel_provider_code))
  )
end

LOCATIONS.each do |location|
  Location.create!(
    name: location.fetch(:name),
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64),
    location_group: LocationGroup.find_by!(name: location.fetch(:location_group_name))
  )
end

TARGET_GROUPS.each do |target_group|
  create_target_group(target_group)
end
