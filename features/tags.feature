Feature: Tags page
  Scenario: Visit this page without login
    When I visit the page for the tags
    Then I should see "Login"