Feature: Google's Search Functionality

Background:
  Given I am on https://www.google.co.uk

Scenario: Can find search results
  When I fill in "q" found by "name" with "BrowserStack"
  And I submit
  Then I should see title "BrowserStack - Google Search"


Scenario: Can find search results 2
  When I fill in "q" found by "name" with "Roosterteeth"
    And I submit
    Then I should see title "Roosterteeth - Google Search"
