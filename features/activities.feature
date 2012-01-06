Feature: Activities page
  Scenario: Visit this page without login
    When I visit the page for the activities
    Then I should see "Login"