Feature: Admin
  Scenario: See registered users
  An admin should be able to see all registered users.
    Given I am an admin
    And there is the articles
    And I want to see all registered users
    And I am signed in
    When I visit the article page
    Then I should see a link for site admin
    When I click the link for site admin
    Then I should see the dashboard that show the list of all models
    When I click the link for manage users
    Then I should see the list of registered users

  Scenario: Ban a user
  An admin should be able to unactive a user
    Given I am an admin
    And there is the articles
    And I want to see all registered users
    And I am signed in
    When I visit the article page
    Then I should see a link for site admin
    When I click the link for site admin
    Then I should see the dashboard that show the list of all models
    When I click the link for manage users
    Then I should see the list of registered users
    When I click edit button for updating user's information
    Then I should see a checkbox for inactive a user
    When I click uncheck at active status for inactive a user

  Scenario: See Registered Users Statistics
  An admin should be able to see registered users statistics.
    Given I am an admin
    And there is the articles
    And I want to see all registered users
    And I am signed in
    When I visit the article page
    Then I should see a link for the statistics
    When I click the link for the statistics
    Then I should see the charts of registered users
