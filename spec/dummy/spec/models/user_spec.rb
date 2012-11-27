require 'spec_helper'

describe PlazrAuth::User do

  it "displays the user's username after successful login" do
    user=FactoryGirl.create :user
    user.name.should == 'user_first_name'
  end

end
