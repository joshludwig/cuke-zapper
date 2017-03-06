Feature: Search
  In order to find a car I would like to drive
  As a potential buyer
  I want search for something specific

  @zap
  Scenario: Simple search
    Given I go to the hackyourself page
    When I search for 'McLaren'
    Then I am told I searched for 'McLaren' on the search page

