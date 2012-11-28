@PlazrAuth @authentication @wip
Feature: Sign In

	In order to have access to protected sections of the platform
	As a visitor 	
	I want to be able to sign in

	Background:
		Given I am not authenticated
		And I am on the 'Sign In' page
		And the following users exist in the database:
			| email             | password | provider |
			| test@u-play.com   | test     | u-play   |
			| test@facebook.com | test     | facebook |
			| test@twitter.com  | test     | twitter  |


	Scenario: Sign in successfully with email and password 

		I should be able to sing in with username and password

		When I fill in 'user_email' with 'test@u-play.com'
		And I fill in 'user_password' with 'test'
		And I click on 'Sign In'
		Then I should see 'Successfully Signed In'


	Scenario: Sign in with wrong password

		I should be notified if I try to sign in with a wrong password

		When I fill in 'user_email' with 'test@u-play.com'
		And I fill in 'user_password' with 'wrong'
		And I click on 'Sign In'
		Then I should see 'Wrong password entered'


	Scenario: Sign in with unregistered email

		I should be notified if I try to sign in with an unregistered email

		When I fill in 'user_email' with 'wrong'
		And I fill in 'user_password' with 'test'
		And I click on 'Sign In'
		Then I should see 'That email isn't registered'
