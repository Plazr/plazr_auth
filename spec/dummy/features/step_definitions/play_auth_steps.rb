def create_visitor
  @visitor ||= {:first_name => 'User', :email => 'example@example.com', :password => 'password', :password_confirmation => 'password' }
end

def delete_user
  @user ||= PlazrAuth::User.first, conditions => { :email => @visitor[:email] }
  @user.destroy unless @user.nil?
end

def create_or_get_user
  @user ||= lambda do
    create_visitor
    delete_user
    Factory.create(:user, :email => @visitor[:email])
  end.call

  @user.save
  return @user
end

Given /^I am signed out$/ do
	if !@user.nil?
		click_link 'Sign Out'
	end
end

Given^/^I am signed in$/ do
  create_or_get_user
  sign_in
end

#And /^I am on the '(.*)' page do
#end

Then /^I should print '(.*)'$/ do |output|
	print output
end
