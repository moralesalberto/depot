Feature: Edit products
  Scenario: Edit a product successfully
    Given there is an Admin user
    And there is a Product
    When the Admin goes to the edit page for the product
    Then the Edit Product form should be shown
    When the Admin completes editing the fields on the Edit Product form
    And submits the Edit Product form
    Then the changes for the product should be saved
    And a success page should be shown with the product that was just edited
