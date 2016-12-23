class ChangeUsersToMusicians < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :musicians
  end
end
