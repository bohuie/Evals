Feature: Login
  
  Scenario: Must be logged in
    When I navigate to "home"
    Then I see "warning" alert "You need to sign in or sign up before continuing."
     And I should be on the "sign in" page

  Scenario: Can log in 
    Given I am logged in as "Eval Uator"
     Then I see "info" alert "Signed in successfully."
      And I should be on the "home" page

  Scenario: Can log out
    Given I am logged in as "Eval Uator"
     When I log out
     Then I see "warning" alert "You need to sign in or sign up before continuing."
      And I should be on the "sign in" page

  Scenario: Non-Admin users cannot see the admin page
    Given I am logged in as "Eval Uator"
     When I navigate to "admin"
     Then I should be on the "home" page

  Scenario: Admin users can see the admin page
    Given I am logged in as the admin user
     When I navigate to "admin"
     Then I should be on the "admin" page

  # TODO: Implement this
  # Scenario: Client can see the correct menu items.
  #  Given I am logged in as client "Cli Ent"
  #   Then I should see menu items "Create Client Feedback and My Client Feedback"

  Scenario: Client can see client feedback
   Given I am logged in as client "Cli Ent"
    When I navigate to "my client feedback"
    Then I should be on the "my client feedback" page

  Scenario: Client can create new client feedback
   Given I am logged in as client "Cli Ent"
    When I navigate to "create new client feedback"
    Then I should be on the "create new client feedback" page

  Scenario: Client cannot see admin page
   Given I am logged in as client "Cli Ent"
    When I navigate to "admin"
    Then I should be on the "home" page

  Scenario: Client cannot see create user page
   Given I am logged in as client "Cli Ent"
    When I navigate to "create user"
    Then I should be on the "home" page

  Scenario: Client cannot create teams
   Given I am logged in as client "Cli Ent"
    When I navigate to "create team"
    Then I should be on the "home" page

  Scenario: Client cannot see teams page
   Given I am logged in as client "Cli Ent"
    When I navigate to "teams"
    Then I should be on the "home" page

  Scenario: Client cannot see milestones
   Given I am logged in as client "Cli Ent"
    When I navigate to "milestones"
    Then I should be on the "home" page

  # FIXME: These all fail and need guards with redirect.  Do we care?
  Scenario: Client cannot create new group evaluations
   Given I am logged in as client "Cli Ent"
    When I navigate to "create new group evaluation"
    Then I should be on the "home" page

  Scenario: Client cannot see my group evaluations page
   Given I am logged in as client "Cli Ent"
    When I navigate to "my group evaluations"
    Then I should be on the "home" page

  Scenario: Client cannot see my peer evaluations page
   Given I am logged in as client "Cli Ent"
    When I navigate to "my peer evaluations"
    Then I should be on the "home" page

  Scenario: Client cannot create new peer evaluations
   Given I am logged in as client "Cli Ent"
    When I navigate to "create new peer evaluation"
    Then I should be on the "home" page