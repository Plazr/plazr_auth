class CreatePlazrAuthRoles < ActiveRecord::Migration

  def connection
    PlazrAuth::User.connection
  end

  def change
    create_table :plazr_auth_roles do |t|

      t.string :name, :null => false
      t.string :desc
      
      t.timestamps
    end
  end
end
