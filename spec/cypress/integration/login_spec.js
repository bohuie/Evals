describe('Sign In', function() {
    before(() => {
      cy.app('clean') // have a look at cypress/app_commands/clean.rb
      cy.exec('npm run db:seed')
    });

    it('Redirects non-authenticated users to the sign-in page', function() {
      cy.visit('/feedbacks');
      cy.url().should('include', '/sign_in')
    });

    it('Admin can login', function() {
      cy.visit('/users/sign_in')

      const username = "admin@localhost.com"
      const password = "adminpassword"

      cy.get('input[id=user_email]').type(username)

      // {enter} causes the form to submit
      cy.get('input[id=user_password]').type(`${password}{enter}`)

      cy.visit('/feedbacks');
      cy.url().should('include', '/feedbacks')
    });

    it('User can login', function() {
      cy.visit('/users/sign_in')

      const username = "user.one@localhost.com"
      const password = "useronepassword"

      cy.get('input[id=user_email]').type(username)

      // {enter} causes the form to submit
      cy.get('input[id=user_password]').type(`${password}{enter}`)

      cy.visit('/feedbacks');
      cy.url().should('include', '/feedbacks')
    });
});
