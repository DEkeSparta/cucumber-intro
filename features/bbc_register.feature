Feature: BBC Registration

  Scenario: Accessing the register page
    Given I am on the homepage
    When I click the sign in link
    And I click Register Now
    Then I should be on the sign up page

  Scenario: Creating an under thirteen account
    Given I am on the sign up page
    When I click that I am under thirteen
    Then I should be on the parent email page

  Scenario: Entering an under thirteen age for an over thirteen account
    Given I am on the sign up page
    When I click that I am over thirteen
    And I input an age under thirteen
    Then I should get a date of birth error

  Scenario: Entering an invalid age for an over thirteen account
    Given I am on the sign up page
    When I click that I am over thirteen
    And I input an invalid age
    Then I should get a date of birth error

  Scenario: Entering an valid age for an over thirteen account
    Given I am on the sign up page
    When I click that I am over thirteen
    And I input a valid age
    Then I should see a username field

  Scenario: Entering no info to the registration form
    Given I have navigated to the registration form
    When I click submit form
    Then I should get five errors

  Scenario: Entering an occupied email to the registration form
    Given I have navigated to the registration form
    And I input a taken email
    And I input a valid password
    And I input a valid postcode
    And I select a gender
    And I click opt out
    When I click submit form
    Then I should get an email error

  Scenario: Entering an invalid email to the registration form
    Given I have navigated to the registration form
    And I input an invalid email
    And I input a valid password
    And I input a valid postcode
    And I select a gender
    And I click opt out
    When I click submit form
    Then I should get an email error

  Scenario: Entering a too short password to the registration form
    Given I have navigated to the registration form
    And I input a valid email
    And I input a short password
    And I input a valid postcode
    And I select a gender
    And I click opt out
    When I click submit form
    Then I should get a password error

  Scenario: Entering a too simple password to the registration form
    Given I have navigated to the registration form
    And I input a valid email
    And I input a simple password
    And I input a valid postcode
    And I select a gender
    And I click opt out
    When I click submit form
    Then I should get a password error
