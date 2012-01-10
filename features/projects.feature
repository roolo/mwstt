Feature: Projects page
  Scenario: Visit this page without login
    When I visit the page for the projects
    Then I should see "Login"

  Scenario: Visit this page logged in
    Given a logged in user
    When I visit the page for the projects
    Then I should see "Projects list"

  Scenario: Create new project
    Given a data for project
    Given a logged in user
    When I visit the new page for the projects
     And I fill project form
    Then I should see success notice