@PlazrAuth @wip
Feature: Sign Up

	In order to have access to protected sections of the platform
	As a visitor
	I want to be able to register in the platform


	Background:

		Given I am not authenticated
		And I am on the 'Sign Up' page


	Scenario Outline: Sign up successfully with email and password

		I should be able to sign up with email and password

		When I fill in 'user_email' with 'test_user'
		And I fill in 'user_password' with 'test_user'
		And I fill in 'user_password_confirmation' with 'test_user'
		And I press 'Sign Up'
		Then I should see 'Signed up successfully'


	Scenario: Sign up with existing email

		I should be notified if my email is already registered

		Given Email 'test_repeated' is already registered
		When I fill in 'user_email' with 'test_repeated'
		And I fill in 'user_password' with 'test_repeated'
		And I fill in 'user_password_confirmation' with 'test_repeated'
		And I press 'Sign Up'
		Then I should see 'Email already registered'



	Scenario Outline: User signs up with invalid data

		I should be notified if I enter invalid data

		When I sign up with a <data>
		Then I should see a <message>
	Examples:
			| Data                                 | Message                               |
			| invalid email                        | invalid email message                 |
			| no password                          | missing password message              |
			| no password confirmation             | missing password confirmation message |
			| mismatched password and confirmation | mismatched password message           |

