class UsersAddUsernamePassword < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :username
      t.string :password
    end
  end
end
