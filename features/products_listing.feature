Feature: Admin interface to view products
  Scenario: Show product listing
    Given there is an Admin user
    When the Admin user visits the products page
    Then a list of products should be shown, each with a link to View the product detail
    And a link to Add a New Product should also be shown

