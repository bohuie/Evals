Feature: Group Evaluations

  # Scenario: Can See Group Evaluation Page
  #  Given I am logged in as "Eval Uator"
  #   When I navigate to "my group evaluations"
  #   Then I should be on the "my group evaluations" page
  #    And I should see a heading "Group Evals You Created"
  #    And I should see a heading "Group Evals For You"

  Scenario: Can See Group Evals I created
    Given User "Eval Uator" exists
      And User "Eval Uatee" exists
      And Team "Evaluationers" exists
      And "Eval Uator" is on team "Evaluationers"
      And "Eval Uatee" is on team "Evaluationers"
      And I am logged in as "Eval Uator"
     When I create a good group evaluation for "Evaluationers" and milestone "Requirements"
      And I navigate to "my group evaluations"
     Then I should see a good group evaluation I created for "Evaluationers" and milestone "Requirements"