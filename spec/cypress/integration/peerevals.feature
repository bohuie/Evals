Feature: Peer Evaluations

  Scenario: Can See Peer Evaluation Page
   Given I am logged in as user "Eval Uator"
    When I navigate to "my peer evaluations"
    Then I should be on the "my peer evaluations" page
     And I should see a heading "Peer Evals You Created"
     And I should see a heading "Peer Evals For You"