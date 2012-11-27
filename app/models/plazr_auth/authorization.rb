# author Naps62
module PlazrAuth
  class Authorization < ActiveRecord::Base
    include PlazrAuth::SharedModel

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
