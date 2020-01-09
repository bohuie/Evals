Feature: Login

  Scenario: Can See Milestones in the admin page
    Given I am logged in as the admin user
     When I navigate to "admin milestones"
     Then I should be on the "admin milestones" page
