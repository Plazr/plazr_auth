@PlazrAuth @wip
Feature: Sign Out

	In order to protect my account from unauthorized access
	A signed in user
	Should be able to sign out

	Scenario: Sign out
		Given I am signed in
		When I click on 'Sign Out'
		Then I should not be signed in
		And I should see the platform's homepage
