class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :bandname
      t.string :genre
      t.string :bio
      t.string :youtube
      t.string :soundcloud
      t.string :bandcamp
      t.timestamps
    end
  end
end
