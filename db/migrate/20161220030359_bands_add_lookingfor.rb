class BandsAddLookingfor < ActiveRecord::Migration[5.0]
  def change
    change_table :bands do |t|
      t.string :looingfor
    end
  end
end
