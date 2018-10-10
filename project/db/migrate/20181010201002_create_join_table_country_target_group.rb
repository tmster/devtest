class CreateJoinTableCountryTargetGroup < ActiveRecord::Migration[5.2]
  def change
    create_join_table :countries, :target_groups do |t|
      t.index [:country_id, :target_group_id], name: "index_countries_target_groups_on_ids"
      t.index [:target_group_id, :country_id], name: "index_countries_target_groups_on_ids_reversed"
    end
  end
end
