PZA = PlazrAuth

require 'spec_helper'
require 'cancan/matchers'

describe PlazrAuth::User do
  describe 'abilities' do

    subject { ability }
    let(:ability){ PZA::Ability.new(user) }

    context 'when is an unregistered user' do
      let(:user) { nil }
    end

    context 'when is a registered user' do
      let(:user) { FactoryGirl.create :user }

      it { should be_able_to(:profile, user) }
    end

    context 'when is and admin' do
      let(:user) { FactoryGirl.create :admin }

      it { should be_able_to(:manage, :all) }
    end
  end
end
