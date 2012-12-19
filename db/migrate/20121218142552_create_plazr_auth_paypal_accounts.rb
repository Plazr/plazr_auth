class CreatePlazrAuthPaypalAccounts < ActiveRecord::Migration
  def connection
    PlazrAuth::User.connection
  end
  
  def change
    create_table :plazr_auth_paypal_accounts do |t|
      t.integer :store_id
      t.string :api_password 
      t.string :api_username
      t.string :signature      
    end
  end
end
