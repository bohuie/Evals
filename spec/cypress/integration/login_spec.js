describe('Sign In', function() {
    beforeEach(() => {
      cy.app('clean') // have a look at cypress/app_commands/clean.rb
    })
  
    it('Loads the Sign-in Page', function() {
        cy.visit('/users/sign_in');
    })
})
