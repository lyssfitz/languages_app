describe("Profile page", () => {
  before(() => {
    // First clean the database
    cy.app("clean");

    // Then register a user
    cy.visit("/create_account");

    // Fill in the form
    cy.get('input[id="user_first_name"]').type("John");
    cy.get('input[id="user_last_name"]').type("Smith");
    cy.get('input[id="user_email"]').type("johnsmith@gmail.com");
    cy.get('input[id="user_password"]').type("password");
    cy.get('input[id="user_password_confirmation"]').type("password");
    cy.get('input[id="user_date_of_birth"]').type("1980-01-01");
    cy.get('input[id="user_gender_male"]').click();
    cy.get('input[id="user_role_student"]').click();
    cy.get('textarea[id="user_biography"]').type("I'm an awesome guy.");

    // Submit
    cy.get('input[name="commit"]').click();
  });

  it("should display the page content", () => {
    cy.visit("/profile");
  });
});

// John visits his profile page

// He sees his name, location and language details.
