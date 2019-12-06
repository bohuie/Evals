import { Given } from 'cypress-cucumber-preprocessor/steps';

const urls = {
  "admin": "/admin",
  "home": "/",
  "sign in": "/users/sign_in",
  "sign out": "/users/sign_out"
}

// const reverse_url_mapper = {};

// for (const url_description in url_mapper) {
//   reverse_url_mapper[url_mapper[url_description]] = url_description;
// }

Given('I am not logged in', () => {
  cy.clearCookies();
})

Given('I am logged in as {string} with password {string}', (username, password) => {
  cy.clearCookies();
  cy.visit(urls["sign in"]);
  cy.get("input[id=user_email]").type(username);
  cy.get("input[id=user_password]").type(`${password}{enter}`);
})

When('I log out', () => {
  cy.visit(urls["sign out"]);
});

When('I navigate to {string}', (page) => {
  cy.visit(urls[page]);
});

Then('I see {string} alert {string}', (level, text) => {
  cy.get(`div.alert-${level} > div.container`).contains(text).should('be.visible');
});

// Then('I see a header {string}', (text) => {
//   cy.get(`div.alert-${level} > div.container`).contains(text).should('be.visible');
// });

Then('I should be on the {string} page', (page) => {
  cy.url().should('include', urls[page]);
});