import { Given, Then } from 'cypress-cucumber-preprocessor/steps';
import { urls } from './urls';

Given('I am not logged in', () => {
  cy.clearCookies();
})

Given('I log in as {string} with password {string}', (username, password) => {
  cy.clearCookies();
  cy.visit(urls["sign in"]);
  cy.get("input[id=user_email]").type(username);
  cy.get("input[id=user_password]").type(`${password}{enter}`);
  cy.url().should('include', urls["home"]);
});

When('I log out', () => {
  cy.visit(urls["sign out"]);
});

When('I navigate to {string}', (page) => {
  cy.visit(urls[page]);
});

Then('I see {string} alert {string}', (level, text) => {
  cy.get(`div.alert-${level} > div.container`).contains(text).should('be.visible');
});

Then('I should see a heading {string}', (text) => {
  cy.get('h1, h2, h3, h4, h5, h6').contains(text).should('be.visible');
});

Then('I should be on the {string} page', (page) => {
  cy.url().should('include', urls[page]);
});