class BandsLookingforCorrectSpelling < ActiveRecord::Migration[5.0]
  def change
    rename_column :bands, :looingfor, :lookingfor
  end
end
