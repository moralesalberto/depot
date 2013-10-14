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
$ bundle exec cucumber

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
If you run cucumber again, of course you expect your tests to fail. That is the point, the errors will point you to where to go next.

```
$ bundle exec cucumber

Using the default profile...
Feature: Admin interface to view and create products

  Scenario: Show product listing                                            # features/products.feature:2
    Given there is an Admin user                                            # features/products.feature:3
      Undefined step: "there is an Admin user" (Cucumber::Undefined)
      features/products.feature:3:in `Given there is an Admin user'
    When the Admin user visits the products page                            # features/products.feature:4
      Undefined step: "the Admin user visits the products page" (Cucumber::Undefined)
      features/products.feature:4:in `When the Admin user visits the products page'
    Then a list of products should be shown with links to view/modifiy them # features/products.feature:5
      Undefined step: "a list of products should be shown with links to view/modifiy them" (Cucumber::Undefined)
      features/products.feature:5:in `Then a list of products should be shown with links to view/modifiy them'
    And a link to Add a New Product should be shown as well                 # features/products.feature:6
      Undefined step: "a link to Add a New Product should be shown as well" (Cucumber::Undefined)
      features/products.feature:6:in `And a link to Add a New Product should be shown as well'

1 scenario (1 undefined)
4 steps (4 undefined)
0m0.182s

You can implement step definitions for undefined steps with these snippets:

Given(/^there is an Admin user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^the Admin user visits the products page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a list of products should be shown with links to view\/modifiy them$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a link to Add a New Product should be shown as well$/) do
  pending # express the regexp above with the code you wish you had
end

```

The output tells you that the steps are not defined. That is the expected behavior. So now, we create one step definition at a time. The output shows you the possible step definitions you can start with. So let's take the first one:

```

Given(/^there is an Admin user$/) do
  pending # express the regexp above with the code you wish you had
end
```

We create a new file in `/features/step_definitions` and call it `products.rb`. Now we need to replace the `pending` line with the ruby test code that will test that condition.

``` ruby
Given(/^there is an Admin user$/) do
  FactoryGirl.create(:user)
  User.count.should eq(1)
end
```

Since we do not have a factory yet, let's create the `factories.rb` file in `features/support`. In that file we will have:

``` ruby
FactoryGirl.define do
  factory :user do
    :username 'some_username_here'
  end
end
```

Before running the test again, we need to create our User model and run the migrations.

``` 
$ rails g model user username:string

$ rake db:migrate
$ rake db:test:prepare

```

Now, if we run the cucumber command again, we should pass the first step definition.

```
$ bundle exec cucumber
Using the default profile...
Feature: Admin interface to view and create products

  Scenario: Show product listing                                            # features/products.feature:2
    Given there is an Admin user                                            # features/step_definitions/products.rb:1
    When the Admin user visits the products page                            # features/products.feature:4
      Undefined step: "the Admin user visits the products page" (Cucumber::Undefined)
      features/products.feature:4:in `When the Admin user visits the products page'
    Then a list of products should be shown with links to view/modifiy them # features/products.feature:5
      Undefined step: "a list of products should be shown with links to view/modifiy them" (Cucumber::Undefined)
      features/products.feature:5:in `Then a list of products should be shown with links to view/modifiy them'
    And a link to Add a New Product should be shown as well                 # features/products.feature:6
      Undefined step: "a link to Add a New Product should be shown as well" (Cucumber::Undefined)
      features/products.feature:6:in `And a link to Add a New Product should be shown as well'

1 scenario (1 undefined)
4 steps (3 undefined, 1 passed)
0m0.204s

You can implement step definitions for undefined steps with these snippets:

When(/^the Admin user visits the products page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a list of products should be shown with links to view\/modifiy them$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a link to Add a New Product should be shown as well$/) do
  pending # express the regexp above with the code you wish you had
end
```

Now we create the next step definition which requires the user to visit a URL.

``` ruby
When(/^the Admin user visits the products page$/) do
  visit(products_path)
end
```

For that to pass, we need to create a route for the products listing page.
So in the `conf/routes.rb` file we add the resource route for products

``` ruby
Depot::Application.routes.draw do
  resources :products
end
```

We are also going to need the ProductsController that is associated with that route.

```
$ rails g controller products
```

In the `products_controller.rb` file just generated, we are going to need the index action.

``` ruby
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
```

We are also going to need the Product model because it is not in place yet. From the command line:

```
$ rails g model Product title:string description:text image_url:string price:decimal
$ rake db:migrate
$ rake db:test:prepare
```

Now before we run our test, we need to setup the view for the index action. This is our first exposure to HAML. So we need to add it to our `Gemfile`

``` ruby
gem 'haml'
```

And run `bundle install` to install haml on your system. Now we can create the view. In `app/views/products` create the file `index.html.haml`. For now we will
just have an empty file.

After all that code, if we run cucumber, the results will be:

```
$ bundle exec cucumber
Using the default profile...
Feature: Admin interface to view and create products

  Scenario: Show product listing                                            # features/products.feature:2
    Given there is an Admin user                                            # features/step_definitions/products.rb:1
    When the Admin user visits the products page                            # features/step_definitions/products.rb:6
    Then a list of products should be shown with links to view/modifiy them # features/products.feature:5
      Undefined step: "a list of products should be shown with links to view/modifiy them" (Cucumber::Undefined)
      features/products.feature:5:in `Then a list of products should be shown with links to view/modifiy them'
    And a link to Add a New Product should be shown as well                 # features/products.feature:6
      Undefined step: "a link to Add a New Product should be shown as well" (Cucumber::Undefined)
      features/products.feature:6:in `And a link to Add a New Product should be shown as well'

1 scenario (1 undefined)
4 steps (2 undefined, 2 passed)
0m0.770s

You can implement step definitions for undefined steps with these snippets:

Then(/^a list of products should be shown with links to view\/modifiy them$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a link to Add a New Product should be shown as well$/) do
  pending # express the regexp above with the code you wish you had
end
```

So all our tests have passed so far. The next step is to test that we are getting a list of products in the page. For this, we will create a factory to create some products first.


