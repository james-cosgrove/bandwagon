class UsersAddUsernameAgain < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :username
    end
  end
end
