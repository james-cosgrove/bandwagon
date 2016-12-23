class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.string :instruments
      t.string :location
      t.timestamps
    end
  end
end
