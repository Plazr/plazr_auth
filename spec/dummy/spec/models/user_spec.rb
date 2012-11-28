require 'spec_helper'

describe PlazrAuth::User, :type => :model do

  it 'creates a new instance given a valid attribute' do
    FactoryGirl.create(:user).should be_valid
  end
  
  describe '#to_s' do
    it 'returns the users full name if it exists' do
      user = FactoryGirl.create(:user)
      user.to_s.should == 'Miguel Palhas'
    end

    it 'returns the email if there is no name' do
      user = FactoryGirl.create(:facebook_user)
      user.to_s.should == 'mpalhas@gmail.com'
    end
  end

end
