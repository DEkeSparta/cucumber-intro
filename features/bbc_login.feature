Feature: BBC Login

  Scenario: Inputting incorrect username credentials shows an error
    Given I access the bbc login page
    And I input incorrect username details
    And I input incorrect password details
    When I submit my details
    Then I receive and error for not finding the account
