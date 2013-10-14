Depot Application
-----------------

This is an exercise of taking the rails Depot application
and writing it with Cucumber features and HAML for the views

The first step is to create the rails application without 
the unit tests

```
$ rails new depot --skip-test-unit
```
Next we need to setup the test environment. Add to the Gemfile

``` ruby
group :test do
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl'
end
```
And we need to generate the cucumber specific files

```
$ rails g cucumber:install
```
That will have created the necessary default files and the the needed `features` directory at the top level.
To make sure your setup is all set, run cucumber from the command line. The result should be 0 tests run since there are no features yet.

```
$ cucumber

Using the default profile...
0 scenarios
0 steps
0m0.000s
```

The next step is to create `.feature` files in the `features` directory. We will start with the listing of products for the admin interface.

``` cucumber
Feature: Admin interface to view and create products 
  Scenario: Show product listing
  Given there is an Admin user
  When the Admin user visits the products page
  Then a list of products should be shown with links to view/modifiy them
  And a link to Add a New Product should be shown as well
```

