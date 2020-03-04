import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';
import { getTeam } from './team';

When('I create a good client feedback for {string} and milestone {string}', function (teamName, milestone) {
  const team = getTeam(cy, teamName);

  cy.visit(urls['create new client feedback']);

  cy.get('[name="feedback[milestone_id]"]').select(milestone);
  cy.get('[name="feedback[team_id]"]').select(team.teamName);

  cy.get('[name="feedback[q1]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q2]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q3]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q4]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q5]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q6]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q7]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q8]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q9]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q10]"]').select('5 (Strong agree)');
  cy.get('[name="feedback[q11]"]').select('5 (Strong agree)');

  cy.get('[name="feedback[oeq1]"]').type(`${team.teamName} is so strong.  So much strength.  Awesome.`);
  cy.get('[name="feedback[oeq2]"]').type(`Service is so good from ${team.teamName}!`);
  cy.get('[name="feedback[oeq3]"]').type(`Stop doing anything else, just work on my project ${team.teamName}!`);
  cy.get('[name="commit"]').click();
});


Then('I should see a good client feedback I created for {string} and milestone {string}', function (teamName, milestone) {

  const team = getTeam(cy, teamName);

  cy.visit(urls['my client feedback']);
  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Milestone')
    .parent('p')
    .should('contain', milestone);

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Team Under Evaluation')
    .parent('p')
    .should('contain', teamName);


  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Project Expectations')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Requirements Have Good Scope')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Good Quantity And Quality')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Confidence With Project Completion')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Would Hire Full Team')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Are Respectful')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Do What Is Expected')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Keep You Up-to-date')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Follow Through With Deliverables')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Communicate Concerns Clearly')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Students Are Proactive With Your Needs')
    .parent('p')
    .should('contain', '5');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Score')
    .parent('p')
    .should('contain', '45 / 45');

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Strengths')
    .parent('p')
    .should('contain', `${team.teamName} is so strong.  So much strength.  Awesome.`);

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Improvements')
    .parent('p')
    .should('contain', `Service is so good from ${team.teamName}!`);

  cy
    .get('h1')
    .contains('Client Feedback You Created')
    .siblings('p')
    .contains('Changes Required')
    .parent('p')
    .should('contain', `Stop doing anything else, just work on my project ${team.teamName}!`);
});
