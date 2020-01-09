import { Given, When } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';

const uuid = require('uuid/v4');
const getenv = require('getenv');

export function loginWithUsernameAndPassword(cy, username, password) {
  cy.clearCookies();
  cy.visit(urls['sign in']);
  cy.get('input[id=user_email]').type(username);
  cy.get('input[id=user_password]').type(`${password}{enter}`);
  cy.url().should('include', urls.home);
}

export function getUser(cy, name) {
  let user;

  if (!this.users) {
    this.users = {};
  }

  if (!(name in this.users)) {
    const password = uuid().substring(0, 20);
    const firstName = name.split(' ')[0];
    const lastName = name.split(' ')[1];
    const username = `${firstName}.${lastName}+${Date.now()}@localhost.com`;

    loginWithUsernameAndPassword(cy, getenv('ADMIN_USERNAME', 'admin@localhost.com'), getenv('ADMIN_PASSWORD', 'adminpassword'));

    cy.visit(urls['create user']);
    cy.url().should('include', urls['create user']);
    cy.get('input[id=user_email]').type(username);
    cy.get('input[id=user_password]').type(`${password}`);
    cy.get('input[id=user_first_name]').type(`${firstName}`);
    cy.get('input[id=user_last_name]').type(`${lastName}{enter}`);

    cy.get('div.alert-success').contains('User successfully created').should('be.visible');
    user = {
      username,
      password,
    };

    this.users[name] = user;
  }

  return this.users[name];
}

Given('User {string} exists', function (name) {
  getUser.bind(this)(cy, name);
});

Given('I am logged in as user {string}', function (name) {
  const user = getUser.bind(this)(cy, name);
  loginWithUsernameAndPassword(cy, user.username, user.password);
});

Given('I am not logged in', function () {
  cy.clearCookies();
});

Given('I am logged in as the admin user', function () {
  cy.clearCookies();
  loginWithUsernameAndPassword(cy, getenv('ADMIN_USERNAME', 'admin@localhost.com'), getenv('ADMIN_PASSWORD', 'adminpassword'));
});

When('I log out', () => {
  cy.visit(urls['sign out']);
});
