Feature: Client Feedback

  Scenario: Can See Client Feedback Page
   Given I am logged in as client "Cli Ent"
    When I navigate to "my client feedback"
    Then I should be on the "my client feedback" page
     And I should see a heading "Client Feedback You Created"

  Scenario: Can See Client Feedback I created
    Given User "Eval Uateeone" exists
      And User "Eval Uateetwo" exists
      And Team "Evaluationers" exists
      And "Eval Uateeone" is on team "Evaluationers"
      And "Eval Uateetwo" is on team "Evaluationers"
      And I am logged in as client "Cli Ent"
     When I create a good client feedback for "Evaluationers" and milestone "Design"
      And I navigate to "my client feedback"
     Then I should see a good client feedback I created for "Evaluationers" and milestone "Design"