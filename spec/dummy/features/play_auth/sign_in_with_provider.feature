@PlazrAuth @wip
Feature: Sign In from provider

	In order to login easily
	As a user of other websites
	I want to be able to login with those credentials

	Background:
		Given I am not authenticated
		And I am on the 'Sign In' page

	# TODO é preciso pensar melhor este
	Scenario Outline: Sign in successfully with a provider account previously registered

		I want to be able to login with those credentials

		When I click on 'Sign In with <provider>'
		Then I should see 'Successfully Signed In'
		And I should be signed in with <provider>
		Examples:
			| provider  |
			| Facebook  |
			| Twitter   |
			| Google    |


	# TODO é preciso pensar melhor este
	Scenario Outline: Sign in successfully with a provider account for the first time

		A user should be able to choose his profile type in
		his first sign in with provider

		When I click on 'Sign In with <provider>'
		And it's the first time I sign in with <provider> and some credentials 
		Then I should see 'Successfully Signed In'
		And I should be signed in with <provider>
		And I should be registered in the system
		Examples:
			| provider  |
			| Facebook  |
			| Twitter   |
			| Open ID	  |
