Feature: Admin
  Scenario: See registered users
  An admin should be able to see all registered users.
    Given I am an admin
    And there is the articles
    And I want to see all registered users
    And I am signed in
    When I visit the article page
    Then I should see a link for the manage user
    When I click the link for the manage user
    Then I should see the list of registered users

  Scenario: Ban a user
  An admin should be able to ban a user.
    Given I am an admin
    And there is the articles
    And I want to see all registered users
    And I am signed in
    When I visit the article page
    Then I should see a link for the manage user
    When I click the link for the manage user
    Then I should see the list of registered users
    When I click the checkbox for ban a user


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
