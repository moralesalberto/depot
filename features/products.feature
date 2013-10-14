Feature: Admin interface to create and view products for the online store
  Scenario: Show product listing
  Given there is an Admin user
  When the Admin user visits the products page
	Then a list of products should be shown with links to modify them
	And a link to Add a New Product should be shown as well
