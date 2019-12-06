Feature: Login
  
  Scenario: Must be logged in
    When I navigate to "home"
    Then I see "warning" alert "You need to sign in or sign up before continuing."
     And I should be on the "sign in" page

  Scenario: Can log in 
    Given I log in as "user.one@localhost.com" with password "useronepassword"
     Then I see "info" alert "Signed in successfully."
      And I should be on the "home" page

  Scenario: Can log out
    Given I log in as "user.one@localhost.com" with password "useronepassword"
     When I log out
     Then I see "warning" alert "You need to sign in or sign up before continuing."
      And I should be on the "sign in" page

  Scenario: Non-Admin users cannot see the admin page
    Given I log in as "user.one@localhost.com" with password "useronepassword"
     When I navigate to "admin"
     Then I should be on the "home" page

  Scenario: Admin users can see the admin page
    Given I log in as "admin@localhost.com" with password "adminpassword"
     When I navigate to "admin"
     Then I should be on the "admin" page
