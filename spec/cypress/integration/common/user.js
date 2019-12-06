import { Given, Then } from 'cypress-cucumber-preprocessor/steps';
import { urls } from './urls';


Given('I create a new user {string} with username {string} and password {string}', (name, username, password) => {

    const first_name = name.split(" ")[0]
    const last_name = name.split(" ")[1]

    cy.visit(urls["create user"]);
    cy.url().should('include', urls["create user"]);
    cy.get("input[id=user_email]").type(username);
    cy.get("input[id=user_password]").type(`${password}`);
    cy.get("input[id=user_first_name]").type(`${first_name}`);
    cy.get("input[id=user_last_name]").type(`${last_name}{enter}`);
});
  