import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';
import { getTeam } from './team';

When('I create a good group evaluation for {string} and milestone {string}', function (teamName, milestone) {
  const team = getTeam(cy, teamName);

  cy.visit(urls['create new group evaluation']);

  cy.get('[name="group_eval[milestone_id]"]').select(milestone);
  cy.get('[name="group_eval[team_id]"]').select(team.teamName);

  cy.get('[name="group_eval[presentation]"]').select('5 (very good)');
  cy.get('[name="group_eval[answering]"]').select('5 (very good)');
  cy.get('[name="group_eval[contribution]"]').select('5 (very good)');
  cy.get('[name="group_eval[questions]"]').type(`${team.teamName} what do you think about Bob?`);
  cy.get('[name="group_eval[strength]"]').type(`Good team ${team.teamName}!`);
  cy.get('[name="group_eval[weakness]"]').type(`Not many ${team.teamName}!`);
  cy.get('[name="commit"]').click();
});


Then('I should see a good group evaluation I created for {string} and milestone {string}', function (teamName, milestone) {
  const team = getTeam(cy, teamName);

  cy.visit(urls['my group evaluations']);

});
