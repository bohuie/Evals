import { Given } from 'cypress-cucumber-preprocessor/steps';
import urls from './urls';
import { getUser, loginWithUsernameAndPassword } from './user';

const getenv = require('getenv');

const teams = {};

export function getTeam(cy, name) {
  if (name in teams) {
    return teams[name];
  }

  const teamName = `${name}${Date.now()}`;

  loginWithUsernameAndPassword(cy, getenv('ADMIN_USERNAME', 'admin@localhost.com'), getenv('ADMIN_PASSWORD', 'adminpassword'));

  cy.visit(urls['create team']);
  cy.url().should('include', urls['create team']);
  cy.get('input[name="team[name]"]').type(`${teamName}{enter}`);

  cy.get('div.alert-success').contains('Team successfully created').should('be.visible');

  const team = {
    teamName,
  };

  teams[name] = team;

  return teams[name];
}

export function addUserToTeam(cy, userName, teamName) {
  const team = getTeam(cy, teamName);
  const user = getUser(cy, userName);
  cy.visit(urls.teams);
  cy.get('td').contains(team.teamName).siblings('td.links').find('li.edit_member_link').find("a > i").click();
  cy.get('div#team_user_ids_field').find('div.ra-multiselect-left').find('select').select(user.fullName);
  cy.get('div#team_user_ids_field').find("a.ra-multiselect-item-add").click();
  cy.get('button[name="_save"]').click();
}


Given('Team {string} exists', function (name) {
  getTeam(cy, name);
});

Given('{string} is on team {string}', function (userName, teamName) {
  addUserToTeam(cy, userName, teamName);
});
