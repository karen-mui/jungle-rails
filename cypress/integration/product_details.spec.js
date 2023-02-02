describe('go to home page', () => {
  it('should visit home page', () => {
    cy.visit('/')
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should visit product page", () => {
    cy.get('img[alt="Scented Blade"]').click()
    cy.contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.')
  });
})