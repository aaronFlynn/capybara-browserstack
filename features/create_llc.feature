Feature: Create LLC

  Background:
    Given I am on http://localhost:5000/new-charge

  Scenario: Can find search results
    And I fill in "Username" found by "name" with "testUser"
    And I fill in "Password" found by "name" with "password"
    Then I should see "TEST ENVIRONMENT"