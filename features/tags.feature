Feature: Tags page
  Scenario: Visit this page without login
    When I visit the page for the tags
    Then I should see "Login"

  Scenario: Visit this page logged in
    Given a logged in user
    When I visit the page for the tags
    Then I should see "Tags list"
