class MusiciansAddColumns < ActiveRecord::Migration[5.0]
  def change
    change_table :musicians do |t|
      t.string :youtube
      t.string :soundcloud
      t.string :bandcamp
    end
  end
end
