class UpdateRelationshipTable < ActiveRecord::Migration[5.0]
  def change

    rename_column :bands_users, :user_id, :musician_id

    rename_table :bands_users, :bands_musicians

  end
end
