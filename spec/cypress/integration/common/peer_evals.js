import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';
import { getUser } from './user';

When('I create a good peer evaluation for {string} and milestone {string}', function (evaluatee, milestone) {
  const user = getUser(cy, evaluatee);

  cy.visit(urls['create new peer evaluation']);

  cy.get('[name="peer_eval[milestone_id]"]').select(milestone);
  cy.get('[name="peer_eval[user_id]"]').select(user.fullName);

  cy.get('[name="peer_eval[goals]"]').select('4 (very good)');
  cy.get('[name="peer_eval[quality]"]').select('4 (very good)');
  cy.get('[name="peer_eval[effort]"]').select('4 (very good)');
  cy.get('[name="peer_eval[considerate]"]').select('4 (very good)');
  cy.get('[name="peer_eval[knowledge]"]').select('4 (very good)');
  cy.get('[name="peer_eval[sharing]"]').select('4 (very good)');
  cy.get('[name="peer_eval[strength]"]').type(`Good guy ${user.fullName}!`);
  cy.get('[name="peer_eval[weakness]"]').type(`Not many ${user.fullName}!`);
  cy.get('[name="commit"]').click();
});


Then('I should see a good peer evaluation I created for {string} and milestone {string}', function (evaluatee, milestone) {
  const user = getUser(cy, evaluatee);

  cy.visit(urls['my peer evaluations']);

  cy
    .get('h1')
    .contains('Peer Evals You Created')
    .siblings('div').first()
    .get('p')
    .contains('Milestone')
    .parent('p')
    .should('contain', milestone);

  cy
    .get('h1')
    .contains('Peer Evals You Created')
    .siblings('div').first()
    .get('p')
    .contains('Student Under Evaluation')
    .parent('p')
    .should('contain', user.fullName);


  cy
    .get('h1')
    .contains('Peer Evals You Created')
    .siblings('div').first()
    .get('p')
    .contains('Strengths')
    .parent('p')
    .should('contain', `Good guy ${user.fullName}!`);

  cy
    .get('h1')
    .contains('Peer Evals You Created')
    .siblings('div').first()
    .get('p')
    .contains('Areas of Improvement')
    .parent('p')
    .should('contain', `Not many ${user.fullName}!`);
});
