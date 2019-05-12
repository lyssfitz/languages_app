describe('Landing page', () => {
    before(() => {
        cy.app('clean')
    });

    it("should display the page content", () => {
        // John visits the landing page
        cy.visit("/");
        
        // He sees the a welcome message inviting him to join 
        cy.contains('Join the Lang.Up Crew');
        cy.contains('Find a Teacher');
        cy.contains('Create Account');
    });

    it("should allow a new user to initate a registration request", () => {
        // John visit the landing page and decides to join
        cy.visit("/");

        // He clicks the button to create a new account
        cy.contains('Create Account').click();

        // He sees that he is redirected to form that allows him to create an account
        cy.url().should('include', 'create_account');
    });

    it("should allow an existing user to log in", () => {

    });
});