Feature: Admin interface to view and create products 
  Scenario: Show product listing
  Given there is an Admin user
  When the Admin user visits the products page
	Then a list of products should be shown with links to view/modifiy them
	And a link to Add a New Product should be shown as well
