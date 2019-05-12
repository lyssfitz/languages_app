describe('Registration page', () => {
    before(() => {
        cy.app('clean')
    });

    it("should display the page content", function() {
        // John visits the registration page
        cy.visit("/create_account");
        
        // He sees a page title
        cy.contains('Create Account');

        // and a html form
        // cy.contains('Find a Teacher');
        // cy.contains('Create Account');

        // a well as a sumbit button
    });

    it("should allow a new user to register", () => {
        // John visit the registration page and decides to join
        cy.visit("/create_account");

        // He fills in the form
        cy.get('input[id="user_first_name"]').type('John');
        cy.get('input[id="user_last_name"]').type('Smith');
        cy.get('input[id="user_email"]').type('johnsmith@gmail.com');
        cy.get('input[id="user_password"]').type('password');
        cy.get('input[id="user_password_confirmation"]').type('password');
        cy.get('input[id="user_date_of_birth"]').type('1980-01-01');
        cy.get('input[id="user_gender_male"]').click();
        cy.get('input[id="user_role_student"]').click();
        cy.get('textarea[id="user_biography"]').type("I'm an awesome guy.");

        // He then clicks the create button
        cy.get('input[name="commit"]').click();
    });
});