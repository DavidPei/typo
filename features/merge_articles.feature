Feature: Merge Articles
	As an admin
	In order to make blog posts about the same topics easier to access
	I want to be able to merge articles

	Background:
		Given the blog is set up
		And I am logged into the admin panel
		And I am on the new article page
		When I fill in "article_title" with "Foobar"
    	And I fill in "article__body_and_extended_editor" with "ABC"
    	And I press "Publish"
    	And I am on the new article page
    	When I fill in "article_title" with "Foobar2"
    	And I fill in "article__body_and_extended_editor" with "XYZ"
    	And I press "Publish"
    	And I am logged out

	Scenario: A non-admin cannot merge articles
		Given I am logged into the user panel
		And I am on the all articles page
		When I follow "Foobar"
		Then I should not see "Merge Articles"

	Scenario: When articles are merged, the merged article should contain the text of both previous articles
		Given I am logged into the admin panel
		And I am on the all articles page
		When I follow "Foobar"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then I should be on the admin content page
		When I follow "Foobar"
		Then I should see "ABC"
		And I should see "XYZ"

	Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article)
		Given I am logged into the admin panel
		And I am on the all articles page
		When I follow "Foobar"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then I should be on the admin content page
		Then "admin" should be the author of "Foobar"

	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
		Given I am logged into the admin panel
		When I add a comment "abc" to "Foobar"
		And I add a comment "xyz" to "Foobar2"
		And I am on the all articles page
		When I follow "Foobar"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then article "Foobar" should have comments "abc" and "xyz"		

	Scenario: The title of the new article should be the title from either one of the merged articles
		Given I am logged into the admin panel
		And I am on the all articles page
		When I follow "Foobar"
		And I fill in "merge_with" with "4"
		And I press "Merge"
		Then I should be on the admin content page
		And I should see "Foobar"
		But I should not see "Foobar2"
		