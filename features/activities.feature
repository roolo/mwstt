Feature: Activities page
  Scenario: Visit this page without login
    When I visit the page for the activities
    Then I should see "Login"

  Scenario: Visit this page logged in
    Given a logged in user
    When I visit the page for the activities
    Then I should see "Activities list"

  Scenario: Create new activity
    Given a data for activity
    Given a logged in user
    When I visit the new page for the activities
     And I fill activity form
    Then I should see success notice