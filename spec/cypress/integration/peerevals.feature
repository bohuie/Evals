Feature: Peer Evaluations

  Scenario: Can See Peer Evaluation Page
   Given I am logged in as "Eval Uator"
    When I navigate to "my peer evaluations"
    Then I should be on the "my peer evaluations" page
     And I should see a heading "Peer Evals You Created"
     And I should see a heading "Peer Evals For You"

  Scenario: Can See Peer Evals I created
    Given User "Eval Uator" exists
      And User "Eval Uatee" exists
      And I am logged in as "Eval Uator"
     When I create a good peer evaluation for "Eval Uatee" and milestone "Requirements"
      And I navigate to "my peer evaluations"
     Then I should see a good peer evaluation I created for "Eval Uatee" and milestone "Requirements"