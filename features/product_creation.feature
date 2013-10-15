Feature: Create a new product
  Scenario: Create a new product successfully
    Given there is an Admin user
    When the Admin visits the new products page
    Then the New Product form should be shown
    When the admin fills out the New Product form field
    And submits the new product form
    Then a new product should be created
    And a success page should be shown with the newly created product
