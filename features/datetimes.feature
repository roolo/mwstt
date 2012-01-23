Feature: Datetimes page
  Scenario: Visit this page without login
    When I visit the page for the datetimes
    Then I should see "Login"

  Scenario: Visit this page logged in
    Given a logged in user
    When I visit the page for the datetimes
    Then I should see "Datetimes list"

  Scenario: Create new datetime
    Given a data for datetime
    Given a logged in user
    When I visit the new page for the datetimes
     And I fill datetime form
    Then I should see success notice

  Scenario: Edit existing datetime
    Given a data for datetime
    Given logged in as owner
    When I visit the edit page for that datetime
    Then I should see complete datetime form
