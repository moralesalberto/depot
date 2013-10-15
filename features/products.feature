Feature: Admin interface to view and create products 
  Scenario: Show product listing
    Given there is an Admin user
    When the Admin user visits the products page
    Then a list of products should be shown, each with a link to View the product detail
    And a link to Add a New Product should also be shown

  Scenario: Create a new product
    Given there is an Admin user
    When the Admin visits the new products page
    Then the New Product form should be shown
    When the admin fills out the New Product form field
    And submits the new product form
    Then a new product should be created
    And a success page should be shown with the newly created product
