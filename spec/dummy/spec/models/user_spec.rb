require 'spec_helper'

describe PlazrAuth::User, :type => :model do

  it 'creates a new instance given a valid attribute' do
    FactoryGirl.create(:user).should be_valid
  end

  context 'users database should be cleaned between tests' do
    it 'should create a user wihout complaining about email existing' do
      FactoryGirl.create(:user).should be_valid
    end

    it 'should create a user wihout complaining about email existing' do
      FactoryGirl.create(:user).should be_valid
    end
  end
  
  describe '#to_s' do

    it 'returns the email if there is no name' do
      user = FactoryGirl.create(:facebook_user)
      user.to_s.should == 'example@gmail.com'
    end
    it 'returns the users full name if it exists' do
      user = FactoryGirl.create(:user)
      user.to_s.should == 'Miguel Palhas'
    end
  end

  describe '#method_missing' do
    it 'detects a is_ROLE? question' do
      admin = FactoryGirl.create(:admin)
      admin.is_admin?.should be_true
    end

    it 'calls super on other cases' do
      user = FactoryGirl.create(:user)
      expect { user.random_stuff }.to raise_error(NoMethodError)
      expect { user.is_admin }.to raise_error(NoMethodError) # missing question mark
    end
  end

end
