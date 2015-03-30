Feature: Add and edit blogging categories
	As a blog administrator
	In order to make categories for my blogs
	I want to be able to add and edit categories for my blogs

	Background: I am logged in and on the Categories page
		Given the blog is set up
		And I am logged into the admin panel
		And I follow "Categories"

	Scenario: Categories page should display without error
		Then I should see "Description"
		And I should see "Permalink"
		And I should see "Keywords"

	Scenario: Category should be added
		When I fill in "Name" with "Nature"
		And I fill in "Keywords" with "natural"
		And I fill in "Description" with "Mother Earth"
		And I press "Save"
		Then I should see "Nature"
		And I should see "natural"
		And I should see "Mother Earth"

	Scenario: Category should be edited
		When I follow "General"
		And I fill in "Keywords" with "anything"
		And I fill in "Description" with "vague"
		And I press "Save"
		Then I should see "anything"
		And I should see "vague"