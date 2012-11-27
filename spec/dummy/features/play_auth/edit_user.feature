@PlazrAuth
Feature: Edit user profile

	In order to change my personal data
	As a signed in user of the website
	I want to edit my user profile

	Background:
		Given I am signed in

#TODO acabar. para isso tb é preciso saber que coisas editar

	Scenario: Edit account
		When I edit my user profile
		Then I should see an account edited message


