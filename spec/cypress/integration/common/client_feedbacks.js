import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';
import { getTeam } from './team';

When('I create a good client feedback for {string} and milestone {string}', function (teamName, milestone) {
  // TODO: Make the client feedback.
  const team = getTeam(cy, teamName);

  cy.visit(urls['create new client feedback']);
});


Then('I should see a good client feedback I created for {string} and milestone {string}', function (teamName, milestone) {
  // TODO: Verify the client feedback.
  const team = getTeam(cy, teamName);

  cy.visit(urls['my client feedback']);

});
