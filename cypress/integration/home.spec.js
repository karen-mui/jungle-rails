describe('go to home page', () => {
  it('should visit home page', () => {
    cy.visit('/')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})