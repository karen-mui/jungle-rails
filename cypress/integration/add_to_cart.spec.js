describe('go to home page', () => {
  it('should visit home page', () => {
    cy.visit('/')
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should increase cart by 1 when clicked 'Add to Cart'", () => {
    cy.contains('Add')
    .click({force: true})

    cy.contains('My Cart (1)')
  })

})