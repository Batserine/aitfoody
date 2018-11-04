Feature: Reviewer
  Scenario: Creating a Reviews Food Article
  A reviewer should be able to create a reviews food article.
    Given I am a reviewer
    And there is the articles
    And I want to create reviews food articles
    And I am a reviewer signed in
    When I visit the article page
    Then I should see a link for managing my reviews food articles
    When I click the link for managing my reviews food articles
    Then I should see the list of my reviews food articles
    When I click button for creating an new article
    Then I should see a form for adding article's information
    When I fill article's information and click save button
    Then I should see a message which notify that reviews food article was created successfully

  Scenario: Editing a Reviews Food Article Information
  A reviewer should be able to update a reviews food article information.
    Given I am a reviewer
    And there is the articles
    And I want to update reviews food articles
    And I am a reviewer signed in
    When I visit the article page
    Then I should see a link for managing my reviews food articles
    When I click the link for managing my reviews food articles
    Then I should see the list of my reviews food articles
#    When I click button for updating article's information
#    Then I should see a form for editing article's information
#    When I update article's information and click save button
#    Then I should see a message which notify that reviews food article was updated successfully

  Scenario: Deleting a Reviews Food Article
  A reviewer should be able to delete a reviews food article
    Given I am a reviewer
    And there is the articles
    And I want to delete reviews food articles
    And I am a reviewer signed in
    When I visit the article page
    Then I should see a link for managing my reviews food articles
    When I click the link for managing my reviews food articles
    Then I should see the list of my reviews food articles
    When I click button for deleting article's information
    Then I should see a message which notify that reviews food article was deleted successfully

  Scenario: Viewing a Approve/Reject Status and a Comment of Reviews Food Article
  A reviewer should be able to see a approve/reject Status and a comment of a reviews food article.
    Given I am a reviewer
    And there is the articles
    And I want to see the status of reviews food articles
    And I am a reviewer signed in
    When I visit the article page
    Then I should see a link for managing my reviews food articles
    When I click the link for managing my reviews food articles
    Then I should see the list of my reviews food articles
    Then I should see a approve or reject status and a comment from an admin

#  Scenario: Viewing Different Versions of Reviews Food Articles
#  A reviewer should be able to see the different versions of a reviews food article.
#    Given I am a reviewer
#    And there is the articles
#    And I want to create reviews food articles
#    And I am a reviewer signed in
#    When I visit the article page
#    Then I should see a link for managing my reviews food articles
#    When I click the link for managing my reviews food articles
#    Then I should see the list of my reviews food articles
#    When I click button for editing article's information
#    Then I should see the list of previous article versions
#    When I click link 'Diff' for viewing the different contents from new version and old version
#    Then I should see the different contents from new version and old version
#
#  Scenario: Roll Back Version of a Reviews Food Article
#  A reviewer should be able to roll back a version of a reviews food article.
#    Given I am a reviewer
#    And there is the articles
#    And I want to create reviews food articles
#    And I am a reviewer signed in
#    When I visit the article page
#    Then I should see a link for managing my reviews food articles
#    When I click the link for managing my reviews food articles
#    Then I should see the list of my reviews food articles
#    When I click button for editing article's information
#    Then I should see the list of previous article versions
#    When I click link 'Roll' to roll back version of the article
#    Then I should see a message which notify that reviews food article was roll back version successfully