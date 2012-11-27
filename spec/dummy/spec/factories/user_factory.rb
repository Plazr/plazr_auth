FactoryGirl.define do

  factory :user, :class => 'PlazrAuth::User' do
    first_name            'user_first_name'
    email                 'user_email@email.com'
    password              'user_password'
    password_confirmation 'user_password'
    confirmed_at          Time.now
  end
  
end
