Feature: Projects page
  Scenario: Visit this page without login
    When I visit the page for the projects
    Then I should see "Login"