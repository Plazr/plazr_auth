class CreatePlazrAuthPypalAccounts < ActiveRecord::Migration
  def connection
    PlazrAuth::User.connection
  end
  
  def change
    create_table :plazr_auth_pypal_accounts do |t|
      t.string :api_username
      t.string :api_password
      t.string :signature

      t.timestamps
    end
  end
end
