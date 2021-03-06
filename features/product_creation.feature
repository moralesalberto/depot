Feature: Create a new product
  Scenario: Create a new product successfully
    Given there is an Admin user
    When the Admin visits the new products page
    Then the New Product form should be shown
    When the admin fills out the New Product form field
    And submits the new product form
    Then a new product should be created
    And a success page should be shown with the newly created product
  
  Scenario Outline: Admin user attempts to enter a new product with incomplete data
    Given there is an Admin user
    When the Admin visits the new products page
    Then the New Product form should be shown
    When the admin incompletely fills out "<title>", "<description>", "<price>"
    And submits the new product form
    Then an error message should be shown with the "<error>" attribute
    And the New Product form should be shown

    Examples:
      | title  | description                         | price | error       |
      | IPA    | The best beer of the IPA generation | -     | price       |
      | -      | Some other beer                     | 1.25  | title       |
      | Miller | -                                   | 2.35  | description |
