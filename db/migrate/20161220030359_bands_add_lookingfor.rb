class BandsAddLookingfor < ActiveRecord::Migration[5.0]
  def change
    change_table :bands do |t|
      t.string :lookingfor
    end
  end
end
