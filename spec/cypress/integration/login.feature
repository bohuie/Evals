Feature: Login
  
  Scenario: Must be logged in
    When I navigate to "home"
    Then I see "warning" alert "You need to sign in or sign up before continuing."
     And I should be on the "sign in" page

  Scenario: Can log in 
    Given I am logged in as user "Eval Uator"
     Then I see "info" alert "Signed in successfully."
      And I should be on the "home" page

  Scenario: Can log out
    Given I am logged in as user "Eval Uator"
     When I log out
     Then I see "warning" alert "You need to sign in or sign up before continuing."
      And I should be on the "sign in" page

  Scenario: Non-Admin users cannot see the admin page
    Given I am logged in as user "Eval Uator"
     When I navigate to "admin"
     Then I should be on the "home" page

  Scenario: Admin users can see the admin page
    Given I am logged in as the admin user
     When I navigate to "admin"
     Then I should be on the "admin" page
