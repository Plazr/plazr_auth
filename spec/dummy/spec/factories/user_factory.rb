PZA=PlazrAuth

FactoryGirl.define do
  
  factory :unconfirmed_user, :class => PZA::User do
    first_name 'Miguel'
    last_name  'Palhas'
    email      'example@gmail.com'
    password   'bigpassword'
    password_confirmation 'bigpassword'

    factory :user do
      confirmed_at { Time.now }

      after(:create) { |user| user.roles << FactoryGirl.create(:role, name: 'user') }

      factory :admin do
        after(:create) { |user| user.roles << FactoryGirl.create(:role, name: 'admin') }
      end
    end
  end

  factory :facebook_auth, :class => PZA::Authorization do
    provider 'facebook'
    uid      '62'
    name     nil
    email    'example@facebook.com'
    link     'http://www.facebook.com/mpalhas'
    image_url 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc6/275143_100000633932565_1808846092_q.jpg'
  end

  factory :google_auth, :class => PZA::Authorization do
    provider 'google'
    uid      '62'
    name     nil
  end

  factory :facebook_user, :parent => :user do
    first_name nil
    last_name nil
    after(:create) { |fb_user| FactoryGirl.create :facebook_auth, :user => fb_user }
  end

  factory :google_user, :parent => :user do
    first_name nil
    after(:create) { |g_user| FactoryGirl.create :google_user, :user => g_user }
  end
end
