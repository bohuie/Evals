Feature: Peer Evaluations

  Scenario: Can See Peer Evaluation Page
   Given I log in as "admin@localhost.com" with password "adminpassword"
     And I create a new user "Eval Uator" with username "evaluator@localhost.com" and password "evaluatorpassword"
     And I log out
     And I log in as "evaluator@localhost.com" with password "evaluatorpassword"
    When I navigate to "my peer evaluations"
    Then I should be on the "my peer evaluations" page
     And I should see a heading "Peer Evals You Created"
     And I should see a heading "Peer Evals For You"