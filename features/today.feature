Feature: Today page
  Scenario: Visit the page without login
    When I visit the page for the today
    Then I should see "Login"

  Scenario: Visit this page logged in
    Given a logged in user
    When I visit the page for the today
    Then I should see "Today"

