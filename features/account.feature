Feature: Account page
  @screenshot
  Scenario: Visit this page without login
    When I visit the page for the account
    Then I should see "Login"
    
  Scenario: Visit new account without login
    When I visit the new page for the account
    Then I should see "Registration"