# author Naps62
module PlazrAuth
  # Class representing the authorization information relative to the user
  class Authorization < ActiveRecord::Base
    include PlazrAuth::SharedModel
    include PlazrAuth::ParanoiaInterface

    belongs_to :user

    attr_accessible :provider,
                    :uid,
                    :user_id,
                    :email,
                    :token,
                    :name,
                    :link,
                    :image_url

  end
end
