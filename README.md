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

```
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
That will have created the necessary default files and the the needed features directory at the top level.

