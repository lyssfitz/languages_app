describe("Landing page", () => {
  before(() => {
    cy.app("clean");
  });

  it("should display the page content", () => {
    // John visits the landing page
    cy.visit("/");

    // He sees the a welcome message inviting him to join
    cy.contains("Join the Lang.Up Crew");
    cy.contains("Find a Teacher");
    cy.contains("Create Account");
  });

  it("should allow a new user to initate a registration request", () => {
    // John visit the landing page and decides to join
    cy.visit("/");

    // He clicks the button to create a new account
    cy.contains("Create Account").click();

    // He sees that he is redirected to form that allows him to create an account
    cy.url().should("include", "create_account");
  });

  it("should allow an existing user to log in", () => {
    // Create a user
    cy.visit("/create_account");
    cy.get('input[id="user_first_name"]').type("John");
    cy.get('input[id="user_last_name"]').type("Smith");
    cy.get('input[id="user_email"]').type("johnsmith@gmail.com");
    cy.get('input[id="user_password"]').type("password");
    cy.get('input[id="user_password_confirmation"]').type("password");
    cy.get('input[id="user_date_of_birth"]').type("1980-01-01");
    cy.get('input[id="user_gender_male"]').click();
    cy.get('input[id="user_role_student"]').click();
    cy.get('textarea[id="user_biography"]').type("I'm an awesome guy.");
    cy.get('input[name="commit"]').click();

    // Todo: there seems to be a bug with cypress, cannot click logout button
    cy.get('a[href="/logout"]').click();
    // Now let's log out
    // cy.contains("Profile").click();
    // cy.contains("Log out")
    //   .trigger("mouseover")
    //   .click();
  });
});
