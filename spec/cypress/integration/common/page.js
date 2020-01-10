import { Then, When } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';


When('I navigate to {string}', function (page) {
  cy.visit(urls[page]);
});

Then('I see {string} alert {string}', function (level, text) {
  cy.get(`div.alert-${level} > div.container`).contains(text).should('be.visible');
});

Then('I should see a heading {string}', function (text) {
  cy.get('h1, h2, h3, h4, h5, h6').contains(text).should('be.visible');
});

Then('I should be on the {string} page', function (page) {
  cy.url().should('eq', `${Cypress.config('baseUrl')}${urls[page]}`);
});

// TODO: Implement this into tests.
Then('I should see menu items {string}', function (items) {
  const itemList = items.split(/( and )|(, )/);
});
